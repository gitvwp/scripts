@echo off
REM Script to download individual YouTube video on Windows. Script dated 2018-01-13
REM Note: Linux uses one %, whereas Windows requires two %%

:start
echo --------------------
echo Youtube-dl batch script (user input)
echo.
echo %date%.
echo.
echo Enter "1" for "--batch-file=input.txt"
echo.
echo To download playlist, Enter "--yes-playlist [URL]"
echo.
echo For example: Enter "--yes-playlist https://www.youtube.com/playlist?list=blah"
echo --------------------

set /p videourl="Enter video URL (Enter "1" for batch download): "
if /I "%videourl%" EQU "1" set videourl="--batch-file=input.txt"

set firecommand=youtube-dl --write-sub --sub-lang en --restrict-filenames -f best -ciw -v -o "individual/%%(title)s-%%(upload_date)s-%%(id)s.%%(ext)s" %videourl%

echo --------------------
echo Script: %firecommand%
echo --------------------

:choice
set AnswerString-A=
set /P AnswerString-A=[%TIME:~0,2%:%TIME:~3,2%:%TIME:~6,2%] Do you wish to proceed? [Y/N]?
if /I "%AnswerString-A%" EQU "Y" goto :proceed
if /I "%AnswerString-A%" EQU "N" goto :donotproceed
goto :choice

:proceed

%firecommand%

echo Finished on %time% %date%

PAUSE

goto :start

EXIT

:donotproceed

echo "I am here because you typed N"
goto :choice

PAUSE
EXIT
