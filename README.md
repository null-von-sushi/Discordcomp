
# NOTE:
### I take no responsibility, but it _shouldn't_ set your computer on fire.

## A Companion to launch native dummy programs 
This was made to launch empty dummy programs that do absolutely nothing, for the sole purpose of having them be selectable when playing windows games using wine in discord. For example, if you play Vampire the Masquerade: Bloodlines using wine, the .exe file is called `Vampire.exe`. Discord on Linux will not show that as a game. What this does is copy a dummy program written in C, renames it Vampire.exe.dummy and launches it while you play. After you are done playing it should automatically kill the dummy program and remove it from the temporary folder. This allows you to add a custom game called "Vampire.exe.dummy" to discord, and then rename it to "Vampire the Masquerade: Bloodlines", allowing you to show everyone that you have great taste in games.

## How to use 
**Step 1** `git clone https://github.com/Null-Senpai/Discord-for-Linux-Wine-helper`  

**Step 2a** You trust me: delete dummy.c if you want, it's not needed.  

**Step 2b** You don't trust me: check the script and the C source code for anythig 🐟-y, delete the `dummy` binary and then compile the dummy file from scratch (that would be `gcc -o dummy dummy.c`).  

**Step 3** Edit the processes.txt to match the names of the .exe files of your games. Each process should look have the full name, with proper capitalization, seperated by new lines.   

**Step 4** Run discordcomp.sh

You do not need to launch it with every game or something. It is essentially intended as background service. 

## Possible Bugs / Known issues
 - I have only tested .exe names which contain no spaces. I guess if you are adding .exe names with spaces, you might want to escape them? (e.g. `Name\ of\ executable\ with\ spaces.exe`). I am not sure yet, I will adress this once I notice it misbehave 😀
 - If you wanna stop the script, make sure any wine programs are closed before. Or just manually kill all the `name-of-exefile.exe.dummy` programs later. Not really a big deal, but I thought I'd mention it.
 - This thing technically does a lot of polling, so theoretically there is an impact on battery life on laptops. Really, I cannot imagine it taking more battery power then having Task Manager on Windows open in the background would. Essentially it asks the OS "is `game.exe` running?" every 10 seconds...

## To-do / Wishlist
 - Would be nice if we could not poll, but instead somehow only run when `wineserver` is started or something?
 - Would be nice if we could add extended discord info (Discord's "Rich Presence") to the dummy files. It would not be game-specific, at least not without also keeping a database of 'special' games, but it might say things like "In game: League of Legends. Currently running using WINE on Linux" or something. I am not sure if this would work however, since you have to manually set the game name anyways (the executables are just called `exe-name.exe.dummy` after all)...

## Put together from info found here:

* https://askubuntu.com/questions/157779/how-to-determine-whether-a-process-is-running-or-not-and-make-use-it-to-make-a-c#157787
* https://feedback.discordapp.com/forums/326712-discord-dream-land/suggestions/16143823-a-wine-companion-app-for-gnu-linux-client-users
<- the main reason I put this together, since discord *still* doesn't support wine applications and it's annoying to have to manually quit the dummy app.



