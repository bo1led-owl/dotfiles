hl.monitor({
  output   = "eDP-1",
  mode     = "1920x1200",
  position = "0x0",
  scale    = 1,
})

local wallpaper = "~/Pictures/Wallpapers/sword.jpg"
local launcher = "fuzzel"
local terminal = "foot"
local bar = "waybar"

hl.env("HYPRCURSOR_THEME", "capitaine-cursors")
hl.env("HYPRCURSOR_SIZE", "32")
hl.env("MOZ_ENABLE_WAYLAND", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
hl.env("QT_QPA_PLATFORM", "wayland")

hl.on("hyprland.start", function()
  hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme \"Gruvbox-Dark\"")
  hl.exec_cmd(bar)
  hl.exec_cmd("mako")
  hl.exec_cmd("swaybg -i " .. wallpaper .. " -o \\* -m fill")
  hl.exec_cmd("wl-paste --type text --watch clipman store")
  hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1")
  hl.exec_cmd("hyprctl setcursscale: 1.5,or capitaine-cursors 32")
  hl.exec_cmd("~/.config/hypr/scripts/idle")
  hl.exec_cmd("systemctl --user import-environment XDG_CURRENT_DESKTOP XDG_SESSION_TYPE")
  hl.exec_cmd("dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)

hl.config({
  general = {
    gaps_in = 0,
    gaps_out = 0,
    border_size = 1,
    col = {
      active_border = "rgba(d8d8d8cc)",
      inactive_border = "rgba(0f0f0fcc)",
    },
    layout = "dwindle",
  },
  input = {
    kb_layout = "us,ru",
    kb_options = "grp:alt_shift_toggle,caps:escape",
    numlock_by_default = true,
    follow_mouse = 2,
    float_switch_override_focus = 0,
    accel_profile = "flat",
    sensitivity = 0,
    scroll_factor = 1,
    touchpad = {
      natural_scroll = true,
      scroll_factor = 0.5,
      disable_while_typing = true,
    },
  },
  decoration = {
    rounding = 0,
    blur = {
      enabled = false,
    },
  },
  animations = {
    enabled = false,
  },
  dwindle = {
    preserve_split = true,
    force_split = 2,
  },
  misc = {
    disable_hyprland_logo = true,
    mouse_move_enables_dpms = true,
    key_press_enables_dpms = true,
    mouse_move_focuses_monitor = true,
  }
})

hl.device({
  name = "ftcs1000:00-2808:0105-touchpad",
  sensitivity = 0.8,
})

hl.gesture({
  fingers = 3,
  direction = "horizontal",
  action = "workspace",
  scale = 0.5,
})

hl.window_rule({
  match = { class = "firefox" },
  workspace = 1,
})
hl.window_rule({
  match = { class = "^(showmethekey-gtk)(.*)$" },
  float = true,
  pin = true,
  border_size = 0,
})
hl.window_rule({
  match = { title = "Telegram" },
  workspace = 3,
})
hl.window_rule({
  match = { fullscreen = true },
  idle_inhibit = "fullscreen",
})
hl.window_rule({
  match = { workspace = "w[t1]" },
  border_size = 0,
})

local mainMod = "SUPER"

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind("CTRL + Space", hl.dsp.exec_cmd(launcher))
hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({mode = "fullscreen", action = "toggle"}))
hl.bind(mainMod .. " + SHIFT + Space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.exec_cmd("~/scripts/mirror"))
hl.bind(mainMod .. " + SHIFT + C", hl.dsp.exec_cmd("killall " .. bar))
hl.bind(mainMod .. " + C", hl.dsp.exec_cmd(bar))

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ +5%"))
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("pactl set-sink-volume @DEFAULT_SINK@ -5%"))

hl.bind("XF86AudioMute", hl.dsp.exec_cmd("pactl set-sink-mute @DEFAULT_SINK@ toggle"))
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"))
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"))
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl set +5%"))
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"))

hl.bind("Print", hl.dsp.exec_cmd("~/scripts/screenshot"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("~/scripts/screenshot_all"))

hl.bind(mainMod .. " + j", hl.dsp.focus({direction = "d"}))
hl.bind(mainMod .. " + k", hl.dsp.focus({direction = "u"}))
hl.bind(mainMod .. " + h", hl.dsp.focus({direction = "l"}))
hl.bind(mainMod .. " + l", hl.dsp.focus({direction = "r"}))

hl.bind(mainMod .. " + 1", hl.dsp.focus({workspace = 1}))
hl.bind(mainMod .. " + 2", hl.dsp.focus({workspace = 2}))
hl.bind(mainMod .. " + 3", hl.dsp.focus({workspace = 3}))
hl.bind(mainMod .. " + 4", hl.dsp.focus({workspace = 4}))
hl.bind(mainMod .. " + 5", hl.dsp.focus({workspace = 5}))
hl.bind(mainMod .. " + 6", hl.dsp.focus({workspace = 6}))
hl.bind(mainMod .. " + 7", hl.dsp.focus({workspace = 7 }))
hl.bind(mainMod .. " + 8", hl.dsp.focus({workspace = 8}))
hl.bind(mainMod .. " + 9", hl.dsp.focus({workspace = 9}))
hl.bind(mainMod .. " + 0", hl.dsp.focus({workspace = 10}))

hl.bind(mainMod .. " + SHIFT + 1", hl.dsp.window.move({ workspace = 1 }))
hl.bind(mainMod .. " + SHIFT + 2", hl.dsp.window.move({ workspace = 2 }))
hl.bind(mainMod .. " + SHIFT + 3", hl.dsp.window.move({ workspace = 3 }))
hl.bind(mainMod .. " + SHIFT + 4", hl.dsp.window.move({ workspace = 4 }))
hl.bind(mainMod .. " + SHIFT + 5", hl.dsp.window.move({ workspace = 5 }))
hl.bind(mainMod .. " + SHIFT + 6", hl.dsp.window.move({ workspace = 6 }))
hl.bind(mainMod .. " + SHIFT + 7", hl.dsp.window.move({ workspace = 7 }))
hl.bind(mainMod .. " + SHIFT + 8", hl.dsp.window.move({ workspace = 8 }))
hl.bind(mainMod .. " + SHIFT + 9", hl.dsp.window.move({ workspace = 9 }))
hl.bind(mainMod .. " + SHIFT + 0", hl.dsp.window.move({ workspace = 10 }))

hl.bind(mainMod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l"}))
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r"}))
hl.bind(mainMod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u"}))
hl.bind(mainMod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d"}))

hl.bind(mainMod .. " + ALT + L", hl.dsp.window.resize({ x = 25, y = 0}))
hl.bind(mainMod .. " + ALT + H", hl.dsp.window.resize({ x = -25, y = 0}))
hl.bind(mainMod .. " + ALT + K", hl.dsp.window.resize({ x = 0, y = -25}))
hl.bind(mainMod .. " + ALT + J", hl.dsp.window.resize({ x = 0, y = 25}))

hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize())
