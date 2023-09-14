#!/bin/bash
THISDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
RED='\033[0;31m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
BOLD='\033[1m'
RESET='\033[0m'

function echon {
  echo -e "$1"
}

echon "$BLUE$BOLD Installing the goto cli tool...$RESET"
echon "$CYAN"
echon "Creating ~/.tools directory if it does not exist..."
mkdir -p ~/.tools
echon "$GREEN - Created $RESET$CYAN"
echon "Creating ~/.tools/bin directory if it does not exist..."
mkdir -p ~/.tools/bin
echon "$GREEN - Created $RESET$CYAN"
echon "Compiling goto..."
go build $THISDIR 
echon "$GREEN - Compiled $RESET$CYAN"
echon "Moving goto to ~/.tools/bin"
mv $THISDIR/goto ~/.tools/bin/
echon "$GREEN - Moved $RESET$CYAN"

echon "Adding function to zshrc,bashrc or bash_profile"
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

echon "$GREEN - Added function to $RESET$CYAN"

echon "\n\n\n"

echon "$GREEN$BOLD Installation complete! $RESET"
echon "$BLUE$BOLD Please restart your terminal to use the goto command $RESET"
echon "$BLUE$BOLD You can also run the following command to refresh your terminal: $RESET"
echon "$CYAN source ~/.zshrc (or .bashrc etc) $RESET"
