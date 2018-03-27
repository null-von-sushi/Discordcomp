#!/bin/bash
#example script I used to get League of Legends to show up
cd "/media/Data/Games/LeagueOfLegends/" #this is where I have the game installed. Folder includes a "wineprefix" folder, the dummy file we compiled earlier and start.sh
./LoL-dummy & ./start.sh >/dev/null ; echo "wine apparently done (probably a lie)" #start the dumym file AND our wine program at the same time. 

while [ true ]; do     # Endless loop.
  ps -aux | grep "[L]eagueClient.exe" > /dev/null 2>&1  # Check if a program named "LeagueClient.exe is running.  Otherwise it's "not running". 

if [[ "$?" == "0" ]]; then #If there is ANY output it registers as 'running'...
    sleep 5 # so we check again in 5 seconds
else # otherwise, if there is no output at all, it registers as 'not running'...
    killall -9 LoL-dummy && exit #so we kill the dummy process and exit the loop
fi
done


 
