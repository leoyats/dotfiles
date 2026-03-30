local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

-- 1. Appearance logic: Light/Dark mode sync
local function get_appearance()
  if wezterm.gui then return wezterm.gui.get_appearance() end
  return 'Dark'
end

local appearance = get_appearance()
local is_dark = appearance:find 'Dark'

-- 2. UI Palette settings (for tabs and bars)
local palette = {
  bg = is_dark and '#16161e' or '#e1e2e7',
  fg = is_dark and '#c0caf5' or '#3760bf',
  active_bg = is_dark and '#7aa2f7' or '#2e7de9',
  active_fg = is_dark and '#16161e' or '#ffffff',
  hover_bg = is_dark and '#24283b' or '#cfd7e3',
}

-- Set main color scheme
config.color_scheme = is_dark and 'Tokyo Night' or 'Tokyo Night Day'

-- Font settings
config.font = wezterm.font 'MesloLGS NF'
config.font_size = 15
config.line_height = 1.1

-- Window decorations (Traffic lights)
config.window_decorations = "TITLE | RESIZE"
config.window_padding = { left = 15, right = 15, top = 10, bottom = 10 }

-- Glass effect (Increased opacity for light mode to improve readability)
config.window_background_opacity = is_dark and 0.85 or 0.95
config.macos_window_background_blur = 40

-- TAB BAR SETTINGS
config.use_fancy_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.tab_bar_at_bottom = false

config.window_frame = {
  font = wezterm.font({ family = 'MesloLGS NF', weight = 'Bold' }),
  font_size = 15.0,
}

-- Process icon mapping
local function get_process_icon(process_name)
  local icons = {
    ['zsh'] = '', ['bash'] = '', ['node'] = '󰎙', ['git'] = '󰊢',
    ['vim'] = '', ['nvim'] = '', ['sudo'] = '󱆃', ['docker'] = '󰡨',
    ['python'] = '', ['ssh'] = '󰣀',
  }
  return icons[process_name:lower()] or '󰆍'
end

-- Tab Title Formatting
wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local pane = tab.active_pane
  local process_name = string.gsub(pane.foreground_process_name, '(.*[/\\])(.*)', '%2')
  local icon = get_process_icon(process_name)
  local index = tab.tab_index + 1
  local title = '  ' .. index .. ': ' .. icon .. '  ' .. process_name .. '  '

  if tab.is_active then
    return {
      { Background = { Color = palette.active_bg } },
      { Foreground = { Color = palette.active_fg } },
      { Text = title },
    }
  end
  
  local bg = palette.bg
  local fg = is_dark and '#545c7e' or '#587539'
  if hover then 
    bg = palette.hover_bg
    fg = palette.fg
  end

  return {
    { Background = { Color = bg } },
    { Foreground = { Color = fg } },
    { Text = title },
  }
end)

-- Tab Bar Colors
config.colors = {
  tab_bar = {
    background = palette.bg,
    new_tab = { bg_color = palette.bg, fg_color = palette.fg },
    new_tab_hover = { bg_color = palette.active_bg, fg_color = palette.active_fg },
  },
}

-- KEYBINDINGS
config.keys = {
  { key = 't', mods = 'CMD', action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'w', mods = 'CMD', action = act.CloseCurrentPane { confirm = false } },
  { key = 'd', mods = 'CMD', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
  { key = 'D', mods = 'CMD|SHIFT', action = act.SplitVertical { domain = 'CurrentPaneDomain' } },
  { key = 'LeftArrow',  mods = 'CMD', action = act.ActivatePaneDirection 'Left' },
  { key = 'RightArrow', mods = 'CMD', action = act.ActivatePaneDirection 'Right' },
  { key = 'UpArrow',    mods = 'CMD', action = act.ActivatePaneDirection 'Up' },
  { key = 'DownArrow',  mods = 'CMD', action = act.ActivatePaneDirection 'Down' },
}

config.default_cursor_style = 'BlinkingBar'
config.window_close_confirmation = 'NeverPrompt'

return config