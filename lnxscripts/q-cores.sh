### The argument $1 is the filename containing the core BT
### The second and third arguments $2 and $3 are the line numbers to match top down in the BT starting with 1
### If there is no third argument, $2 is the total number of lines to match top down.
LINE1=$2
LINE2=$3

if [ $LINE2 ]
	then
		cat $1 | egrep "^#" | sed 's/.* \(.*\) (.*/\1/g'  | sed -n "${LINE1},${LINE2}p"  > core-in.txt 
	else
		cat $1 | egrep "^#" | sed 's/.* \(.*\) (.*/\1/g'  | head -n $LINE1  > core-in.txt 
fi
ARGS=`echo $(cat core-in.txt)`
echo "###############################################################"
echo "##### PRs matching backtraces inside the Description field ####"
sh q-desc.sh $ARGS
echo
echo "#######################################################################"
echo "##### PRs matching backtraces inside the Corefile-Stacktrace field ####"
sh q-Corefile-Stacktrace.sh $ARGS 
