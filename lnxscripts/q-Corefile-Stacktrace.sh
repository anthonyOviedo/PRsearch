#/bin/bash
for i in $*
	do 
		EXPR=`echo $EXPR \& Corefile-Stacktrace~"\"$i\""`	
	done
EXPR=`echo $EXPR | sed 's/^& //g'`
echo "query-pr: $EXPR"
#/usr/local/bin/query-pr --expr "$EXPR" | egrep -B 4 "Syno" | egrep "Num|Syn"
