set fish_greeting

if status is-interactive
    alias hx "helix --log /dev/null"
    alias ls "ls --group-directories-first --color=auto -h"
    alias fzf "fzf --preview \"bat --color=always --style=numbers --line-range=:100 {}\""

    fish_add_path -g ~/bin
end

function fish_prompt
    set -g __fish_git_prompt_color magenta
    string join '' -- ' ' (set_color green) (prompt_pwd) (set_color normal) (fish_vcs_prompt) ' > '
end
