@echo off
setlocal

:: Do FZF Setting Here
:::: set FZF_DEFAULT_COMMAND=fd -a -j 4
:::: set FZF_DEFAULT_OPTS=--prompt="=>" --border --inline-info
set FZF_DEFAULT_COMMAND=rg --files

:: Process executable input
set EXECUTABLE=%1

:::: If just 'with', no executable so no ext
if not defined EXECUTABLE goto EXEFZF

:::: Get extension and file name
for /f "usebackq delims=" %%a in (`where %EXECUTABLE%`) do (set EXE_EXT=%%~xa) & (set EXE_NAME=%%~na) & goto :GET_EXT_DONE
:GET_EXT_DONE

:::: NOTE: for support *.cmd, we can use example below
:::: set "formats=.cmd.bat."
:::: for /f "usebackq delims=" %%a in (`where %EXECUTABLE%`) do (
::::   if "!formats:%%~xa.=!" neq "!formats!" (
::::     set IS_BAT=true
::::   )
::::   set EXE_EXT=%%~xa
::::   set EXE_NAME=%%~na
:::: )

:::: If still no ext here, means EXECUTABLE is invalid
if not defined EXE_EXT goto END

:EXEFZF
:: Run fzf to get selection
for /f "usebackq delims=" %%i in (`fzf`) do set SELECTION=%%~fi

:::: Go to end if no selection
if not defined SELECTION goto END

:WITH_CALL
call %1 "%SELECTION%"

@echo on
