
#!/bin/bash
#
# find all launchbar action .applescript scripts and compile them
#
LBDEV=.
find $LBDEV -type f -name '*.applescript' -print0 | while read -d '' -r APPLESCRIPT
do
  echo "Compiling $APPLESCRIPT ..."
  SCPT="${APPLESCRIPT%.applescript}.scpt"
  /usr/bin/osacompile -o "$SCPT" "$APPLESCRIPT"
  if [ $? -ne 0 ]
  then
    "Error compiling $APPLESCRIPT" 1>&2
    exit $?
  fi
done
exit 0