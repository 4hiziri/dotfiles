local wezterm = require("wezterm")
local config = wezterm.config_builder()

config.automatically_reload_config = true
config.font_size = 12.0
config.use_ime = true
-- 透過とぼかし効果
config.window_background_opacity = 0.75
config.text_background_opacity = 0.5

config.color_scheme = "Dracula (Official)"
-- 背景色（グラデーション）
config.window_background_gradient = {
    colors = {"#F740D3", "#94D1EB", "#8D11A6"},
    orientation = { Linear = {angle = -35}},
}

-- config.window_background_gradient = {
--     preset = "Inferno",
--     noise = 128,
--     orientation = { Linear = {angle = -35}},
-- }

----------------------------------------------------
-- Tab
----------------------------------------------------
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.show_tabs_in_tab_bar = true
-- config.hide_tab_bar_if_only_one_tab = true

config.window_frame = {
    inactive_titlebar_bg = "none",
    active_titlebar_bg = "none"
}

config.show_new_tab_button_in_tab_bar = false
config.show_close_tab_button_in_tabs = false

config.colors = {
    tab_bar = {
        inactive_tab_edge = "none"
    }
}

-- タブの形をカスタマイズ（矢印型、Nerd Fonts使用）
local SOLID_LEFT_ARROW = wezterm.nerdfonts.pl_right_hard_divider
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_flame_thick

wezterm.on(
    "format-tab-title",
    function(tab, tabs, panes, config, hover, max_width)
        local background = "#5c6d74"
        local foreground = "#FFFFFF"
        local edge_background = "none"

        if tab.is_active then
            background = "#ae8b2d"
            foreground = "#FFFFFF"
        end

        local edge_foreground = background
        local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 1) .. "   "

        return {
            {Background = {Color = edge_background}},
            {Foreground = {Color = edge_foreground}},
            {Text = SOLID_LEFT_ARROW},
            {Background = {Color = background}},
            {Foreground = {Color = foreground}},
            {Text = title},
            {Background = {Color = edge_background}},
            {Foreground = {Color = edge_foreground}},
            {Text = SOLID_RIGHT_ARROW}
        }
    end
)

config.default_cursor_style = "BlinkingBlock"
config.cursor_blink_rate = 600



-- leader key
config.disable_default_key_bindings = true
config.keys = require("keybinds").keys
config.key_tables = require("keybinds").key_tables
config.leader = {key = "q", mods = "CTRL", timeout_milliseconds = 2000}

return config
