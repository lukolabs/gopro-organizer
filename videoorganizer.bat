:setup
echo off
set temp=1
set temp2=1
set rundir=1
setlocal enabledelayedexpansion
cls
:directory
echo Separate mutliple directories with a comma: "C:\user\gopro\folder1,C:\user\gopro\folder2"
set /p path="Directory(s): "
for %%a in ("%path:,=" "%") do (
	set dir!temp2!=%%a
	set /a temp2 = temp2+1
)
set /a maxdir = temp2-1
:main
cd !dir%rundir%!
for %%i in (GH0*.mp4) do (
	set name!temp!=%%i
	set /a temp = temp+1
)
set /a temp = temp-1
for /l %%a in (1,1,%temp%) do (
	md !name%%a:~4,-4!
	move !name%%a! !name%%a:~4,-4!
	move *!name%%a:~4,-4!* !name%%a:~4,-4!
)
:finish
echo !dir%rundir%! is complete.
if %rundir%==%maxdir% goto exit
set /a rundir = rundir+1
set temp=1
goto main
:exit
pause
exit