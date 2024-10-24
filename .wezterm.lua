local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

config.automatically_reload_config = true
-- config.front_end = "WebGpu"
config.enable_wayland = true
config.webgpu_power_preference = "HighPerformance"
config.cursor_blink_ease_in = "Constant"
config.cursor_blink_ease_out = "Constant"

config.underline_thickness = 3
config.cursor_thickness = 4
config.underline_position = -6

-- -- Window
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.88
config.window_padding = {
	left = 2,
	right = 2,
	top = 2,
	bottom = 2,
}

-- Fonts
config.font_size = 11
config.font = wezterm.font({ family = "JetBrains Mono", weight = "Regular" })
config.font_rules = {
	{
		intensity = "Bold",
		font = wezterm.font("JetBrains Mono", { weight = "Bold" }),
	},
	{
		intensity = "Bold",
		italic = true,
		font = wezterm.font("JetBrains Mono", { weight = "Bold", italic = true }),
	},
	{
		italic = true,
		font = wezterm.font("JetBrains Mono", { weight = "Medium", italic = true }),
	},
	{
		intensity = "Half",
		font = wezterm.font("JetBrains Mono", { weight = "Bold", stretch = "Normal" }),
	},
	{
		intensity = "Half",
		italic = true,
		font = wezterm.font("JetBrains Mono", { weight = "Bold", stretch = "Normal", italic = true }),
	},
	{
		intensity = "Half",
		italic = false,
		font = wezterm.font("JetBrains Mono", { weight = "Bold", stretch = "Normal" }),
	},
}

-- Cursor
config.default_cursor_style = "BlinkingBar"
config.force_reverse_video_cursor = true
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }
-- window_background_opacity = 0.9,
-- cell_width = 0.9,
config.scrollback_lines = 10000

-- Colorscheme
config.color_scheme_dirs = { os.getenv("HOME") .. "/.config/wezterm/colors" }
config.color_scheme = "Catppuccin Macchiato"

config.bold_brightens_ansi_colors = true

return config
