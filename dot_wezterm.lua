local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

-- Appearance logic: Light/Dark mode sync
local function get_appearance()
  if wezterm.gui then return wezterm.gui.get_appearance() end
  return 'Dark'
end

local function scheme_for_appearance(appearance)
  if appearance:find 'Dark' then return 'Tokyo Night' else return 'Tokyo Night Day' end
end

config.color_scheme = scheme_for_appearance(get_appearance())

-- Font settings
config.font = wezterm.font 'MesloLGS NF'
config.font_size = 15
config.line_height = 1.1

-- Window decorations (Traffic lights)
config.window_decorations = "TITLE | RESIZE"
config.window_padding = {
  left = 15,
  right = 15,
  top = 10,
  bottom = 10,
}

-- Glass effect
config.window_background_opacity = 0.5
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
    ['zsh']    = '',
    ['bash']   = '',
    ['node']   = '󰎙',
    ['git']    = '󰊢',
    ['vim']    = '',
    ['nvim']   = '',
    ['sudo']   = '󱆃',
    ['docker'] = '󰡨',
    ['python'] = '',
    ['ssh']    = '󰣀',
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
      { Background = { Color = '#7aa2f7' } },
      { Foreground = { Color = '#16161e' } },
      { Text = title },
    }
  end
  
  local bg = '#16161e'
  local fg = '#545c7e'
  if hover then bg = '#24283b'; fg = '#c0caf5' end

  return {
    { Background = { Color = bg } },
    { Foreground = { Color = fg } },
    { Text = title },
  }
end)

-- KEYBINDINGS
config.keys = {
  -- New Tab (Cmd + T)
  { key = 't', mods = 'CMD', action = act.SpawnTab 'CurrentPaneDomain' },
  
  -- Close Current Pane or Tab (Cmd + W)
  {
    key = 'w',
    mods = 'CMD',
    action = act.CloseCurrentPane { confirm = false },
  },

  -- Split vertical (Cmd + D)
  {
    key = 'd',
    mods = 'CMD',
    action = act.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
  
  -- Split horizontal (Cmd + Shift + D)
  {
    key = 'D',
    mods = 'CMD|SHIFT',
    action = act.SplitVertical { domain = 'CurrentPaneDomain' },
  },

  -- Navigation between panes (Cmd + Arrows)
  { key = 'LeftArrow',  mods = 'CMD', action = act.ActivatePaneDirection 'Left' },
  { key = 'RightArrow', mods = 'CMD', action = act.ActivatePaneDirection 'Right' },
  { key = 'UpArrow',    mods = 'CMD', action = act.ActivatePaneDirection 'Up' },
  { key = 'DownArrow',  mods = 'CMD', action = act.ActivatePaneDirection 'Down' },
}

-- Tab Bar Colors
config.colors = {
  tab_bar = {
    background = '#16161e',
    new_tab = { bg_color = '#16161e', fg_color = '#545c7e' },
    new_tab_hover = { bg_color = '#7aa2f7', fg_color = '#1a1b26' },
  },
}

config.default_cursor_style = 'BlinkingBar'
config.window_close_confirmation = 'NeverPrompt'

return config