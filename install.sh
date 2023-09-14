#!/bin/bash

mkdir -p ~/.tools
mkdir -p ~/.tools/bin
go build .
cp ./goto ~/.tools/bin/goto
cp ./goto.sh ~/.tools/bin/goto.sh

function goFile {
  FILE=$1
  # if the file exists
  if [ -f $FILE ]; then
    echo "alias goto='source ~/.tools/bin/goto.sh'" >> $FILE
  fi
}

goFile ~/.bashrc
goFile ~/.zshrc
goFile ~/.bash_profile
