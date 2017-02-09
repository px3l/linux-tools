#!/bin/bash -e

set -e

PATH_TO_FILES=
FILE_TYPE=

a=1
for i in $PATH_TO_FILES/*.$FILE_TYPE; do
  new=$(printf "%04d.$FILE_TYPE" "$a") #04 pad to length of 4
  mv -i -- "$i" "$new"
  let a=a+1
done