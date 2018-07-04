#!/bin/bash


###########################
# Touch at your own peril #
###########################
CURRENT=$1
PID=$2
DB=$3
TMP=$4
if [[ -f $TMP/$CURRENT.dummy ]]
then
    echo "$CURRENT already has an instance running or thread was force closed, exiting"
    exit
fi
if [[ -z $PID ]]
then
    echo "vars not set, exiting"
    exit
fi
cp dummy $TMP/$CURRENT.dummy
chmod +x $TMP/$CURRENT.dummy
$TMP/$CURRENT.dummy > /dev/null &
DUMMYPID=$!
GETCURRENTPID=$(pgrep -x "$CURRENT") 
while [ true ]
do 
    if [[ "$GETCURRENTPID" == "$PID" ]]
    then
        sleep 5
        GETCURRENTPID=$(pgrep -x "$CURRENT") 
    else
        kill -9 $DUMMYPID > /dev/null
        sleep 1
        rm -f $TMP/$CURRENT.dummy
        exit
    fi
done
exit
