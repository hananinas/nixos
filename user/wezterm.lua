local wezterm = require("wezterm")
local mux = wezterm.mux

local config = {}

if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.color_scheme = "GruvboxDarkHard"
config.font = wezterm.font("MesloLGS Nerd Font")
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_close_confirmation = "NeverPrompt"

wezterm.on("gui-startup", function(cmd)
	local tab, pane, window = mux.spawn_window(cmd or {})
	window:gui_window():maximize()
end)

return config
