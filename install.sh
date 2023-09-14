#!/bin/bash

GREEN='\033[0;32m'
BOLD='\033[1m'
RESET='\033[0m'
CYAN='\033[0;36m'
BLUE='\033[0;34m'

echo -e "$BOLD$BLUE
   ____           _           
  / ___|   ___   | |_    ___  
 | |  _   / _ \  | __|  / _ \ 
 | |_| | | (_) | | |_  | (_) |
  \____|  \___/   \__|  \___/ 
$RESET$BLUE                              
--------------------------------
$RESET$CYAN$BOLD    Installing the goto cli $RESET$BLUE
--------------------------------
$RESET
"
THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
mkdir -p ~/.tools
mkdir -p ~/.tools/bin
go build $THISDIR 
mv $THISDIR/goto ~/.tools/bin/

FUNCFILE="$THISDIR/command.sh"
function goFile {
  FILE=$1
  # if the file exists
  if [ -f $FILE ]; then
    EXISTS=$(grep "###START GOTO" $FILE)
    # if the string is found then remove it until end
    if [ -n "$EXISTS" ]; then
      sed -i '' '/###START GOTO/,/###END GOTO/d' $FILE
    fi
    # echo contents from FUNCFILE to the FILE
    CONTENTS="$(cat $FUNCFILE)"
    printf '%s\n' "$CONTENTS" >> $FILE
  fi
}

goFile ~/.bashrc
goFile ~/.zshrc
goFile ~/.bash_profile

echo -e "$GREEN$BOLD Installation complete! $RESET"
echo -e "$BLUE$BOLD Please restart your terminal to use the goto command $RESET"
echo -e "$BLUE$BOLD You can also run the following command to refresh your terminal: $RESET"
echo -e "$CYAN source ~/.zshrc (or .bashrc etc) $RESET"
