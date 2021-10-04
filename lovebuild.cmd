:: this script makes a folder containing your ready-to-play game, and a zip file ready for distribution, in whatever folder it is run
:: the folder it creates will contain an exe file and all the required dlls, and the zip file will contain that same folder
:: GAMENAME is both the name of the folder where your game's Lua code is, and the name that will be given to the directory and zip that this script outputs. avoid having spaces in it.
SET GAMENAME=%1
:: LOVEDIR is a path to the directory where you have LOVE installed, where you can find love.exe and all the dll files required when distributing a LOVE game.
SET LOVEDIR="E:\Documents\Game Design\Engines\LOVE"
:: PROJECTSDIR is a path to the directory where your LOVE projects are. the folder that has your game's Lua code in it should be the same as GAMENAME, and needs to be in this folder.
SET "PROJECTSDIR=E:\Documents\Game Design\Projects\Love\"
mkdir %GAMENAME%
copy /b %LOVEDIR%\love.dll %GAMENAME%\love.dll
copy /b %LOVEDIR%\lua51.dll %GAMENAME%\lua51.dll
copy /b %LOVEDIR%\mpg123.dll %GAMENAME%\mpg123.dll
copy /b %LOVEDIR%\msvcp120.dll %GAMENAME%\msvcp120.dll
copy /b %LOVEDIR%\msvcr120.dll %GAMENAME%\msvcr120.dll
copy /b %LOVEDIR%\OpenAL32.dll %GAMENAME%\OpenAL32.dll
copy /b %LOVEDIR%\SDL2.dll %GAMENAME%\SDL2.dll
powershell.exe -nologo -noprofile -command "& { Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::CreateFromDirectory($env:PROJECTSDIR + $env:GAMENAME, $env:GAMENAME + '\' + $env:GAMENAME + '.love'); }"
copy /b %LOVEDIR%\love.exe+%GAMENAME%\%GAMENAME%.love %GAMENAME%\%GAMENAME%.exe
del %GAMENAME%\%GAMENAME%.love
powershell.exe -nologo -noprofile -command "& { Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::CreateFromDirectory($env:GAMENAME, $env:GAMENAME + '.zip', 'Optimal', 'true'); Write-Host `n; Read-Host -Prompt 'Files copied and written.. YOU are free to go.... ('; }"