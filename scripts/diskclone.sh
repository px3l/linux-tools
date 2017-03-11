#!/bin/bash -e

set -e

export DISK_1=${DISK_1:="$1"}
export DISK_2=${DISK_2:="$2"}
export BLOCK_SIZE=${BLOCK_SIZE:="$3"} || 65536

function clone_disk() {
	local disk1="${1}"
	local disk2="${2}"
	local blocksize="${3}"

	echo "cloning ${disk1} to ${disk2}"
	dd if=${disk1} of=${disk2} bs=${blocksize} conv=noerror,sync
	echo "clone complete"
}

if [ -z "${DISK_1}" ]; then
  >&2 echo "DISK_1 is required"
  exit 1
fi

if [ -z "${DISK_2}" ]; then
  >&2 echo "DISK_2 is required"
  exit 1
fi

if [ ! -d "${DISK_1}" ]; then
  >&2 echo "the disk ${DISK_1} does not exist"
  exit 1
fi

if [ ! -d "${DISK_2}" ]; then
  >&2 echo "the disk ${DISK_2} does not exist"
  exit 1
fi

clone_disk "${DISK_1}" "${DISK_2}"