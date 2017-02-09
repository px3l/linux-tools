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
    echo mv -i -- "$i" "$new"
    imageindex=$((imageindex+1))
  done
}

move_files "${PATH_TO_FILES}" "${FILE_TYPE}"