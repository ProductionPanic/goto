###START GOTO
function goto() {
  OUTPUT=$(~/.tools/bin/goto $@)
  OUTPUTLINES=${OUTPUT//\\n/ }
  for i in "${OUTPUTLINES[@]}"; do
    if [[ $i == \[cd\]* ]]; then
      cd ${i:4}
    else
      echo "$i" 
    fi
  done
}
###END GOTO
