. "$HOME/.cargo/env"

export LC_ALL='en_GB.UTF-8'
export LANG='en_GB.UTF-8'

export TERMINAL='alacritty'
export EDITOR='hx'
export VISUAL="${EDITOR}"

export GPG_TTY="$(tty)"

if [[ -n "${WAYLAND_DISPLAY}" ]]; then
    export MOZ_ENABLE_WAYLAND=1
    export XDG_CURRENT_DESKTOP=sway
fi