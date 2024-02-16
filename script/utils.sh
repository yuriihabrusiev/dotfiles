#!/usr/bin/env bash

get_os() {
  local os=""
  local kernelName=""

  kernelName="$(uname -s)"
  if [ "$kernelName" == "Darwin" ]; then
    os="macos"
  elif [ "$kernelName" == "Linux" ]; then
    os="linux"
  else
    os="$kernelName"
  fi

  echo "$os"
}
