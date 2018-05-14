REM GAMENAME is both the name of the folder where your game's Lua code is, and the name that will be given to the directory and zip that this script outputs. avoid having spaces in it.
SET GAMENAME=gamename
REM LOVEDIR is a path to the directory where you have LOVE installed, where you can find love.exe and all the .dll files required when distributing a LOVE game.
SET LOVEDIR="E:\Documents\Game Design\LOVE"
REM PROJECTSDIR is a path to the directory where your LOVE projects are. the folder that has you game's Lua code in it should be the same as GAMENAME, and needs to be in this folder.
SET "PROJECTSDIR=E:\Documents\Game Design\LOVE Projects\"
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
powershell.exe -nologo -noprofile -command "& { Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::CreateFromDirectory($env:GAMENAME, $env:GAMENAME + '.zip'); }"