local wezterm = require 'wezterm'
local config = wezterm.config_builder()

-- DEFAULT SHELL 
config.default_prog = { 'powershell.exe', '-NoLogo' }
config.default_cwd = "D:\\Projects\\LISAT\\ADCS_29_4_2025\\GitHub_Repo\\CDH"

-- THE LOOKS 
config.color_scheme = 'Catppuccin Mocha' -- A fan favorite
config.font = wezterm.font('JetBrains Mono', { weight = 'Medium' })
config.font_size = 11.0
-- Background Effects
config.win32_system_backdrop = 'Mica' -- Use 'Acrylic' if on Windows 10
config.window_background_opacity = 0.8 -- Required for Mica/Acrylic to show
config.window_decorations = "RESIZE"   -- Removes the thick Windows title bar
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}

config.keys = {
  --  WINDOWS-FRIENDLY KEYS
  { key = 'F11', mods = 'NONE', action = wezterm.action.ToggleFullScreen },
  -- Make Ctrl+C and Ctrl+V work like standard Windows apps
  { key = 'c', mods = 'CTRL', action = wezterm.action.CopyTo 'Clipboard' },
  { key = 'v', mods = 'CTRL', action = wezterm.action.PasteFrom 'Clipboard' },
  -- TAB MANAGEMENT
  { key = 't', mods = 'ALT', action = wezterm.action.SpawnTab 'DefaultDomain' },
  { key = 'w', mods = 'ALT', action = wezterm.action.CloseCurrentTab { confirm = true } },
  -- PANE MANAGEMENT
  { key = 'a', mods = 'ALT', action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' } },    -- Neovim Horizontal Split
  { key = 'd', mods = 'ALT', action = wezterm.action.SplitVertical { domain = 'CurrentPaneDomain' } },      -- Neovim Vertical Split
  { key = 'x', mods = 'ALT', action = wezterm.action.CloseCurrentPane { confirm = true } },                 -- Close a pane
  { key = 'z', mods = 'ALT', action = wezterm.action.TogglePaneZoomState },                                 -- Make one pane fill the whole window temporarily
  -- PANE NAVIGATION 
  { key = 'h',  mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Left' },
  { key = 'l', mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Right' },
  { key = 'k',    mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Up' },
  { key = 'j',  mods = 'ALT', action = wezterm.action.ActivatePaneDirection 'Down' },
  -- PANE RESIZING 
  { key = 'LeftArrow',  mods = 'ALT', action = wezterm.action.AdjustPaneSize { 'Left', 5 } },
  { key = 'RightArrow', mods = 'ALT', action = wezterm.action.AdjustPaneSize { 'Right', 5 } },
  { key = 'UpArrow',    mods = 'ALT', action = wezterm.action.AdjustPaneSize { 'Up', 5 } },
  { key = 'DownArrow',  mods = 'ALT', action = wezterm.action.AdjustPaneSize { 'Down', 5 } },
  -- WEZTERM LAUNCHER
  { key = '+', mods = 'ALT', action = wezterm.action.ShowLauncher },
  -- WORKSPACES
  { key = 's', mods = 'ALT|SHIFT', action = wezterm.action.ShowLauncherArgs { flags = 'WORKSPACES' } },-- Switch to a different workspace via a popup menu
  {                                                                                                     -- Create a new workspace and give it a name
    key = 'w',
    mods = 'ALT|SHIFT',
    action = wezterm.action.PromptInputLine {
      description = wezterm.format {
        { Attribute = { Intensity = 'Bold' } },
        { Foreground = { AnsiColor = 'Fuchsia' } },
        { Text = 'Enter name for new workspace: ' },
      },
      action = wezterm.action_callback(function(window, pane, line)
        if line then
          window:perform_action(
            wezterm.action.SwitchToWorkspace {
              name = line,
            },
            pane
          )
        end
      end),
    },
  },
  { key = 'd', mods = 'ALT|SHIFT', action = wezterm.action.SwitchToWorkspace { name = 'default' } },   -- Switch to the default workspace
  { key = 'h', mods = 'ALT|SHIFT', action = wezterm.action.SwitchWorkspaceRelative(-1) },              -- Go to the previous workspace
  { key = 'l', mods = 'ALT|SHIFT', action = wezterm.action.SwitchWorkspaceRelative(1) },               -- Go to the next workspace
}
-- WORKSPACE INFO ON THE TAB BAR
wezterm.on('update-right-status', function(window, pane)
  local workspace = window:active_workspace()
  
  window:set_right_status(wezterm.format {
    { Foreground = { Color = '#74c7ec' } }, -- A nice light blue color
    { Attribute = { Intensity = 'Bold' } },
    { Text = '  󱂬  ' .. workspace .. '  ' }, -- Includes a workspace icon
  })
end)
-- TAB BAR CONFIG
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = false           

--  MISC ESSENTIALS
config.scrollback_lines = 5000
config.check_for_updates = true
config.window_close_confirmation = 'AlwaysPrompt'

return config
