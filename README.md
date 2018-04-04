# Dummy Application to show wine games in Discord 
Dummy program that makes discord show wine games as the current running application 

## How to use
1) Either copy `LoL-dummy` or create your own by compiling dummy.c if you don't trust me 🙂 (that would be `gcc -o LoL-dummy dummy.c`). I use LoL-dummy because I want that to be the process name for it (since I personally used it for League of Legends).
2) Copy and edit `start.sh` and `start-discord.sh` to suit your needs. `start.sh` basically just runs your wine application normally. `start-discord.sh` is the new file that will run the dummy program and `start.sh` when you play, and quit the dummy program once you finish playing. I tried to add comments to it to explain everything.
3) run `start-discord.sh`, edit the name of the game in Discord itself and enjoy.

You probably need to adjust a few things, but it should be easy enough to figure out what you need to do.

## Important
When editing the files, you may notice that the name of the windows process is `[n]ame.exe` instead of `name.exe`. I don't know WHY exactly, but those square brackets are needed so that the act of "listing all processes named name.exe" doesn't list the process looking for processes named name.exe. I hope this makes sense.

## Put together from info found here:


* https://askubuntu.com/questions/157779/how-to-determine-whether-a-process-is-running-or-not-and-make-use-it-to-make-a-c#157787
* https://feedback.discordapp.com/forums/326712-discord-dream-land/suggestions/16143823-a-wine-companion-app-for-gnu-linux-client-users
<- the main reason I put this together, since discord *still* doesn't support wine applications and it's annoying to have to manually quit the dummy app.



