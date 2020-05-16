
@if (@CodeSection == @Batch) @then
  @echo off

  if "%~1" == "" (
    set word=".*"
  ) else (
    set word=%~1
  )

  FOR /F "tokens=* usebackq" %%t IN (`rg --files . 2^> nul ^
    ^| fzf --no-sort`) DO set prompt_prefill=%%t

  rem ^| grep -iE %word% ^
  rem Enter the prefill value in the keyboard buffer

  CScript //nologo //E:JScript "%~F0" "%prompt_prefill%"
  goto :EOF

@end

WScript.CreateObject("WScript.Shell").SendKeys(WScript.Arguments(0));
