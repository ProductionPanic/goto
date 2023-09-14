#!/bin/bash 
# uninstall
rm -rf ~/.tools/bin/goto ~/.tools/bin/goto.sh

function removeFromFile {
  find="alias goto"
  FILE=$1
  if grep -q "$find" "$FILE"; then
    sed -i '' '/alias goto/d' $FILE
  fi
}

removeFromFile ~/.zshrc
removeFromFile ~/.bashrc
removeFromFile ~/.bash_profile
