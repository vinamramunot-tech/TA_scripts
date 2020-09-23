#!/bin/bash

#Put the time in seconds which the process is allowed to run below
KILL_TIME=1

KILL_LIST=`{
ps -eo uid,pid,lstart | tree |
    while read PROC_UID PROC_PID PROC_LSTART; do
        SECONDS=$[$(date +%s) - $(date -d"$PROC_LSTART" +%s)]
        if [ $SECONDS -gt $KILL_TIME ]; then
        echo -n "$PROC_PID "
        fi
     done 
}`

if [[ -n $KILL_LIST ]]
then
        kill $KILL_LIST
fi