#!/bin/bash
#to run a script call it as ./run_script.sh script_file_path(mandatory) file_path(if ned to copied any file form remote machine genrated by script) file_path(send data file to remote machine and access it in script)
#run any file on prep server by giving complete path of file, it will copy the file and then run the script and then it will remove the file
if [ "$1" != "" ]; then
  if test -e $1; then 
    FILE_NAME=`basename $1`
    scp $1 vinsol@prep.dealdey.com:~
    if test -e $3; then 
      DATA_FILE=`basename $3`
      scp $3 vinsol@prep.dealdey.com:~
    fi
  else
    echo "file not foud at given path, aborting..."
    exit
  fi
else
  echo "Please provide file(with complete path) to run"
  exit
fi

ssh vinsol@prep.dealdey.com -- <<@@
  cd apps/dealdey_prep/current
  RAILS_ENV=prep ruby ~/$FILE_NAME
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

sftp vinsol@prep.dealdey.com -- <<@@
  get $COPY_FILE_NAME
  rm $COPY_FILE_NAME
  exit
  ~.
@@
cp $COPY_FILE_NAME ~/Projects/dealdey_automation/config/data
rm $COPY_FILE_NAME