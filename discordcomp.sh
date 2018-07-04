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
while [ true ]
do
    for i in $(seq 1 $(cat $DB | wc -l))
    do
        CURRENT=$(cat $DB | awk "NR == $COUNT")
        PID=$(pgrep -x "$CURRENT")
        pgrep -x "$CURRENT" > /dev/null 2>&1 #&& echo "$CURRENT is running with PID $PID"
        if [[ $PID == "0" ]]
        then
            true
        elif [[ -z "$PID" ]]
        then
            true
        else
            echo "$CURRENT $PID $DB $TMP" > debug.var
            ./discordcomp.thread.sh "$CURRENT" "$PID" "$DB" "$TMP" > /dev/null & 
        fi
        COUNT=$((COUNT + 1))
        PID=0
    done
done
exit
