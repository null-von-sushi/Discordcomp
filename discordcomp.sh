#!/bin/bash
########################################
# This script needs `wc` and `seq`     #
# Set DB to a custom path if you want  #
# Note that this is untested           #
########################################

DB=processes.txt





###########################
# Touch at your own peril #
###########################
TMP=/tmp/discordhelper
mkdir -p /tmp/discordhelper
rm -rf /tmp/discordhelper/*
PID=0
COUNT=1

function thread {
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
}


while [[ true ]]
do
    for i in $(seq 1 $(cat $DB | wc -l))
    do
        CURRENT=$(cat $DB | awk "NR == $COUNT")
        PID=$(pgrep -x "$CURRENT")
        pgrep -x "$CURRENT" > /dev/null 2>&1 && echo "$CURRENT is running with PID $PID"
        if [[ $PID == "0" ]]
        then
            true
        elif [[ -z "$PID" ]]
        then
            true
        else
            thread "$CURRENT" "$PID" "$DB" "$TMP" > /dev/null & 
        fi
        COUNT=$((COUNT + 1))
        if (( $COUNT > $(cat $DB | wc -l) ))
        then
            COUNT=1
        fi
        PID=0
    done
done


