#!/bin/bash

getftp(){
    file_name=$1
    curdir=`pwd`
    host=`hostname`
    echo ftp://${host}${curdir}/$file_name
}

move_to_trash() {
  local p
  for p in "$@"; do
    # ignore any arguments
    if [[ "$p" = -* ]]; then :
    else
      local dst=${p##*/}
      # append the time if necessary
      while [ -e ~/.Trash/"$dst" ]; do
        dst="$dst "$(date +%H-%M-%S)
      done
      mv "$p" ~/.Trash/"$dst"
    fi
  done
}
alias rm=move_to_trash
