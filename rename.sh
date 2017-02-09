#!/bin/bash -e

set -e

export PATH_TO_FILES=${PATH_TO_FILES:="$1"}
export FILE_TYPE=${FILE_TYPE:="$2"}

function move_files() {
  local filepath="${1}"
  local filetype="${2}"
  local imageindex=1

  for i in ${filepath}/*.${filetype}; do
    new=$(printf "%04d.$FILE_TYPE" "$imageindex") #04 pad to length of 4
    echo "moving ${i} to ${new}"
    mv -i -- "$i" "$new"
    imageindex=$((imageindex+1))
  done
}

if [ -z "${PATH_TO_FILES}" ]; then
  >&2 echo "PATH_TO_FILES is required"
  exit 1
fi

if [ ! -d "${PATH_TO_FILES}" ]; then
  >&2 echo "the folder ${PATH_TO_FILES} does not exist"
  exit 1
fi

move_files "${PATH_TO_FILES}" "${FILE_TYPE}"