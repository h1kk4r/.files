--                                           .o8
--   oooo oooo    ooo  .ooooo.    oooooooo .o888oo  .ooooo.  oooo d8boo ooo. .oo.  .oo.
--    `88. `88.  .8'  d88' `88b  d'""7d8P    888   d88' `88b `888""8P   `888P"Y88bP"Y88b
--     `88..]88..8'   888ooo888    .d8P'     888   888ooo888  888        888   888   888
--      `888'`888'    888    .o  .d8P'  .P   888 . 888    .o  888        888   888   888
--       `8'  `8'     `Y8bod8P' d8888888P    "888" `Y8bod8P' d888b      o888o o888o o888o

local wezterm = require 'wezterm'

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

--config.color_scheme = 'Ashes (base16)'
config.color_scheme = 'Jellybeans'

config.font = wezterm.font_with_fallback({
  'Iosevka',
  --'SF Mono',
  --'Cascadia Code',
  --'Menlo',
  --'Monaco',
})
config.font_size = 13.5
--config.line_height = 1.08

config.initial_cols = 160
config.initial_rows = 44
config.window_padding = {
  left = 50,
  right = 50,
  top = 45,
  bottom = 45,
}

config.window_decorations = 'RESIZE'

config.enable_tab_bar = true
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = false
config.show_tab_index_in_tab_bar = true
config.show_new_tab_button_in_tab_bar = false
config.enable_scroll_bar = false

config.audible_bell = 'Disabled'
config.default_cursor_style = 'SteadyBlock'
config.inactive_pane_hsb = {
  saturation = 0.92,
  brightness = 0.74,
}

return config
