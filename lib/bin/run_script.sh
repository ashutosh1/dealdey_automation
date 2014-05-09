#!/bin/bash
#to run a script call it as ./run_script.sh script_file_path(mandatory) file_path(if ned to copied any file form remote machine genrated by script) file_path(send data file to remote machine and access it in script)
#run any file on prep server by giving complete path of file, it will copy the file and then run the script and then it will remove the file
SERVER="vinsol@staging.dealdey.com"
FOLDER="dealdey_staging"
RAILS_APP_ENV="staging"

if [ "$1" != "" ]; then
  if test -e $1; then 
    FILE_NAME=`basename $1`
    scp $1 $SERVER:~
    if test -e $3; then 
      DATA_FILE=`basename $3`
      scp $3 $SERVER:~
    fi
  else
    echo "file not foud at given path, aborting..."
    exit
  fi
else
  echo "Please provide file(with complete path) to run"
  exit
fi

ssh $SERVER -- <<@@
  cd apps/$FOLDER/current
  RAILS_ENV=$RAILS_APP_ENV ruby ~/$FILE_NAME
  rm ~/$FILE_NAME
  rm ~/$DATA_FILE
  exit
  ~.
@@

if [ "$2" != "" ]; then
  if test -e $2; then 
    COPY_FILE_NAME=`basename $2`
  else
    exit
  fi
else
  exit
fi

sftp $SERVER -- <<@@
  get $COPY_FILE_NAME
  rm $COPY_FILE_NAME
  exit
  ~.
@@
cp $COPY_FILE_NAME ~/Projects/dealdey_automation/config/data
rm $COPY_FILE_NAME