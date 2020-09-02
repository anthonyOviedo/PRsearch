#/bin/bash
Z=""
for i in "$@"
	do
		EXPR=`echo "$i" | sed 's/|/" | Description~"/g' | sed 's/^/\(Description~"/g' | sed 's/$/"\)/g'` 
		Z="$EXPR & $Z"
	done
FINAL_EXPR=`echo $Z | sed 's/&$//g'`
echo "query-pr: $FINAL_EXPR"
#/usr/local/bin/query-pr --expr "$FINAL_EXPR" | egrep -B 4 "Syno" | egrep "Num|Syn" | egrep -v "build failed" | egrep -B 1 Synop | egrep -v "^-"

