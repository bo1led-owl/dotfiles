autoload -U colors && colors
autoload -Uz vcs_info

precmd() { vcs_info }

zstyle ':vcs_info:git:*' formats ' %b'
setopt PROMPT_SUBST
export PROMPT=' %{$fg[green]%}%~%{$reset_color%}%{$fg[magenta]%}${vcs_info_msg_0_}%{$reset_color%} $ '

alias hx="helix"

HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.cache/zsh/history.txt

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
