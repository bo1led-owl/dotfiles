set fish_greeting

if status is-interactive
    alias hx "helix --log /dev/null"
    alias ls "ls --group-directories-first --color=auto -h"
    alias fzf "fzf --preview \"bat --color=always --style=numbers --line-range=:100 {}\""
    alias mpv "mpv --no-audio-display --volume=50 --loop-playlist=inf"
    alias objdump "objdump -M intel"

    fish_add_path -g ~/bin
    set -gx EDITOR "helix"
    set -gx CC "clang"
    set -gx CXX "clang++"
end

function fish_prompt
    set -g __fish_git_prompt_color magenta
    string join '' -- ' ' (set_color green) (prompt_pwd) (set_color normal) (fish_vcs_prompt) ' $ '
end

set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME ; set -gx PATH $HOME/.cabal/bin $PATH /home/bo1led-owl/.ghcup/bin # ghcup-env
# >>> coursier install directory >>>
set -gx PATH "$PATH:/home/bo1led-owl/.local/share/coursier/bin"
# <<< coursier install directory <<<
