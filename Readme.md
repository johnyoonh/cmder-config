## Powerline
Contents are based on https://github.com/AmrEldib/cmder-powerline-prompt

## Stucture
* `user-aliases.cmd`: aliases in cmd; called from vendor\init.bat; autocreated from
`vendor\user-aliases.cmd.default`“.
”* `*.lua`: clink completions and prompt filters; autoloaded after all
  prompt filter and clink completions are initialized; add your own.
* `user-profile.{sh|cmd|ps1}`: startup files for bash|cmd|powershell tasks; called from their
  respective startup scripts in `vendor\`; autocreated from
  `vendor\user-profile.{sh|cmd|ps1}.default` on first start of such a task.
* `.history`: the current commandline history; autoupdated on close.
* `settings`: settings for readline; overwritten on update.
* `ConEmu.xml`: settings from ConEmu (=the UI of cmder -> Preferences); overwritten on update.
* `bin` directory is added to the path by a script "profile.d\path.bat"

## Contents under `bin`
* `r.bat`: simulates fzf on command history. Mapped to "Ctrl-r" in `clink_inputrc`.
* `t.bat`: simulates fzf on current path. Mapped with wrapper [with](https://github.com/jesse23/with) in `clink_inputrc`.
* z.bat: port of a jump command as a replace of autojump's `j` command
