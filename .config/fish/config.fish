set fish_greeting

if status is-interactive
    alias hx "helix --log /dev/null"
    alias ls "ls --group-directories-first --color=auto -h"
    alias fzf "fzf --preview \"cat -n {}\""
    alias mpv "mpv --no-audio-display --volume=50 --loop-playlist=inf"
    alias objdump "objdump -M intel"

    fish_add_path -g ~/bin
    set -gx EDITOR "helix"
    set -gx VISUAL "helix"
    set -gx CC "clang"
    set -gx CXX "clang++"
    set -gx CC_LD "mold"
    set -gx CXX_LD "mold"

    set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
    fish_add_path -g ~/.cabal/bin
    fish_add_path -g ~/.ghcup/bin
    fish_add_path -g ~/.local/share/coursier/bin
    fish_add_path ~/.local/bin

    # ulimit -m 12582912
end

function fish_prompt
    set -g __fish_git_prompt_color magenta
    string join '' -- ' ' (set_color green) (prompt_pwd) (set_color normal) (fish_vcs_prompt) ' $ '
end
