#!/bin/bash

#run any file on  prep server by giving complete path of file without copying it to prep server
if [ "$1" != "" ]; then
  if test -e $1; then 
    FILE_NAME=`cat $1`
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
  bundle exec rails c prep
  $FILE_NAME
  exit
  exit
@@
