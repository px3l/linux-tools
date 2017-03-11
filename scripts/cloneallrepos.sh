#!/bin/bash -e

set -e

export USER=${USER:="$1"}
export PAGE=${PAGE:="$2"}

function clone_all_repos(){
	local user="${1}"
  local page="${2}" || 1

  curl "https://api.github.com/users/${user}/repos?page=${page}&per_page=100" |
	  grep -e 'git_url*' |
	  cut -d \" -f 4 |
	  xargs -L1 git clone
}

if [ -z "${USER}" ]; then
  >&2 echo "USER is required"
  exit 1
fi

clone_all_repos "${USER}" "${PAGE}"