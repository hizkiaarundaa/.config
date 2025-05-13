local wezterm = require("wezterm")
local act = wezterm.action
local config = wezterm.config_builder()

--=========================//
--         COLORS         //
--=========================//
local scheme = "OneDark (base16)"
config.color_scheme = scheme
local scheme_def = wezterm.color.get_builtin_schemes()[scheme]
local bg_custom = "#1e222a"
local fg_inactive = "#666"
local bg_newtab = "#24283b"

config.colors = {
	background = bg_custom,
	tab_bar = {
		active_tab = {
			bg_color = bg_custom,
			fg_color = scheme_def.foreground,
		},
		inactive_tab = {
			bg_color = bg_custom,
			fg_color = fg_inactive,
		},
		inactive_tab_edge = bg_custom,
		new_tab = {
			bg_color = bg_newtab,
			fg_color = scheme_def.foreground,
		},
	},
}
config.window_frame = {
	active_titlebar_bg = bg_custom,
	inactive_titlebar_bg = bg_custom,
}

--=========================//
--      WINDOW OPTIONS     //
--=========================//
config.tab_bar_at_bottom = false
config.tab_max_width = 14
config.window_padding = { left = 5, right = 5, top = 10, bottom = 10 }
config.initial_cols = 125
config.initial_rows = 30
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.window_background_opacity = 0.6
config.adjust_window_size_when_changing_font_size = false
config.audible_bell = "Disabled"
config.exit_behavior = "Close"
config.hide_mouse_cursor_when_typing = true
config.show_tab_index_in_tab_bar = false
config.integrated_title_buttons = { "Hide", "Maximize", "Close" }
config.scrollback_lines = 10000
config.use_dead_keys = false
config.unicode_version = 15
config.macos_window_background_blur = 100
config.window_close_confirmation = "NeverPrompt"
config.default_cursor_style = "BlinkingBar"
config.cursor_blink_rate = 600
config.force_reverse_video_cursor = false


wezterm.on("format-window-title", function(_) return "" end)

--=========================//
--         FONTS          //
--=========================//
config.font = wezterm.font({
	family = "MesloLGS NF",
	weight = "Medium",
	stretch = "Normal",
	style = "Normal",
	harfbuzz_features = { "cv29", "cv30", "ss01", "ss03", "ss06", "ss07", "ss09" },
})
config.font_size = 14
config.freetype_load_flags = "NO_HINTING"
config.front_end = "Software"
config.harfbuzz_features = { "liga=1" }

--=========================//
--     SHELL & CWD        //
--=========================//
config.default_prog = { "C:\\Program Files\\Git\\bin\\bash.exe", "--login", "-i" }
local current_dir = os.getenv("PWD") or os.getenv("OLDPWD")
config.default_cwd = current_dir

--=========================//
--      ENV VARIABLES     //
--=========================//
config.set_environment_variables = {
	prompt = "$E]7;file://localhost/$P$E\\$E[32m$T$E[0m $E[35m$P$E[36m$_$G$E[0m ",
}

--=========================//
--         KEYS           //
--=========================//
config.disable_default_key_bindings = true
config.keys = {
  { action = act.ActivateCommandPalette, mods = "CTRL|SHIFT", key = "P" },
	{ action = act.CopyTo("Clipboard"), mods = "CTRL", key = "C" },
	{ action = act.DecreaseFontSize, mods = "CTRL", key = "-" },
	{ action = act.IncreaseFontSize, mods = "CTRL", key = "=" },
	{ action = act.Nop, mods = "ALT", key = "Enter" },
	{ action = act.PasteFrom("Clipboard"), mods = "CTRL", key = "V" },
	{ action = act.ResetFontSize, mods = "CTRL", key = "0" },
	{ action = act.ToggleFullScreen, key = "F11" },
	{ key = "w", mods = "CTRL", action = act.CloseCurrentTab({ confirm = false }) },
	{ key = "T", mods = "CTRL|SHIFT", action = act.SpawnCommandInNewTab({ args = { "C:\\Program Files\\Git\\bin\\bash.exe", "--login", "-i" }, cwd = current_dir }) },
	{ key = "n", mods = "CTRL|SHIFT", action = act.SpawnCommandInNewWindow({ args = { "C:\\Program Files\\Git\\bin\\bash.exe", "--login", "-i" }, cwd = current_dir }) },
	{
		key = "E", mods = "CTRL|SHIFT",
		action = act.PromptInputLine({
			description = "Enter new name for tab",
			action = wezterm.action_callback(function(window, _pane, line)
				if line then window:active_tab():set_title(line) end
			end),
		}),
	},
	{ key = "{", mods = "SHIFT|ALT", action = act.MoveTabRelative(-1) },
	{ key = "}", mods = "SHIFT|ALT", action = act.MoveTabRelative(1) },
	{ key = "PageUp", mods = "CTRL", action = act.ActivateTabRelative(-1) },
	{ key = "PageDown", mods = "CTRL", action = act.ActivateTabRelative(1) },
	{ key = "v", mods = "CTRL|SHIFT", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "h", mods = "CTRL|SHIFT", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "d", mods = "CTRL|SHIFT", action = act.CloseCurrentPane({ confirm = false }) },
	{ key = "UpArrow", mods = "ALT", action = act.ActivatePaneDirection("Up") },
	{ key = "DownArrow", mods = "ALT", action = act.ActivatePaneDirection("Down") },
	{ key = "LeftArrow", mods = "ALT", action = act.ActivatePaneDirection("Left") },
	{ key = "RightArrow", mods = "ALT", action = act.ActivatePaneDirection("Right") },
	{ key = "UpArrow", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Up", 1 }) },
	{ key = "DownArrow", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Down", 1 }) },
	{ key = "LeftArrow", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Left", 1 }) },
	{ key = "RightArrow", mods = "ALT|SHIFT", action = act.AdjustPaneSize({ "Right", 1 }) },
  { key = "UpArrow", mods = "ALT", action = act.SendKey({ key = "k", mods = "ALT" }) },
	{ key = "DownArrow", mods = "ALT", action = act.SendKey({ key = "j", mods = "ALT" }) },
	{ key = "LeftArrow", mods = "ALT", action = act.SendKey({ key = "LeftArrow", mods = "ALT" }) },
	{ key = "RightArrow", mods = "ALT", action = act.SendKey({ key = "RightArrow", mods = "ALT" }) },
	{ key = "UpArrow", mods = "SHIFT|ALT", action = act.SendKey({ key = "UpArrow", mods = "SHIFT" }) },
	{ key = "DownArrow", mods = "SHIFT|ALT", action = act.SendKey({ key = "DownArrow", mods = "SHIFT" }) },
	{
		key = "x", mods = "CTRL",
		action = wezterm.action_callback(function(window, pane)
			local has_selection = window:get_selection_text_for_pane(pane) ~= ""
			if has_selection then
				window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
				window:perform_action(act.ClearSelection, pane)
			else
				window:perform_action(act.SendKey({ key = "x", mods = "CTRL" }), pane)
			end
		end),
	},
	{
		key = "c", mods = "CTRL",
		action = wezterm.action_callback(function(window, pane)
			local sel = window:get_selection_text_for_pane(pane)
			if not sel or sel == "" then
				window:perform_action(act.SendKey({ key = "c", mods = "CTRL" }), pane)
			else
				window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
			end
		end),
	},
}

--=========================//
--      MOUSE BINDINGS     //
--=========================//
config.mouse_bindings = {
	{
		event = { Drag = { streak = 1, button = "Left" } },
		mods = "SUPER",
		action = wezterm.action.StartWindowDrag,
	},
	{
		event = { Drag = { streak = 1, button = "Left" } },
		mods = "CTRL|SHIFT",
		action = wezterm.action.StartWindowDrag,
	},
	{
		event = { Up = { streak = 1, button = "Left" } },
		mods = "CTRL",
		action = wezterm.action.OpenLinkAtMouseCursor,
	},
}

return config
