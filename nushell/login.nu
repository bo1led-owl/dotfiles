if $env.WAYLAND_DISPLAY? == null and $env.XDG_VTNR == '1' {
  exec sway
}
