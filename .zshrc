# alacritty cursor fix
export XCURSOR_PATH=${XCURSOR_PATH}:~/.local/share/icons
# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="superjarin"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 3

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Start Oh My Zsh
source $ZSH/oh-my-zsh.sh

export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#666666"
export ZSH_AUTOSUGGEST_STRATEGY=(history completion)

# Init zellij
if [[ -z "$ZELLIJ" ]]; then
    if [[ "$ZELLIJ_AUTO_ATTACH" == "true" ]]; then
        zellij attach -c
    else
        zellij
    fi

    if [[ "$ZELLIJ_AUTO_EXIT" == "true" ]]; then
        exit
    fi
fi
