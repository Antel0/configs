-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/debian/.cache/nvim/packer_hererocks/2.1.1741730670/share/lua/5.1/?.lua;/home/debian/.cache/nvim/packer_hererocks/2.1.1741730670/share/lua/5.1/?/init.lua;/home/debian/.cache/nvim/packer_hererocks/2.1.1741730670/lib/luarocks/rocks-5.1/?.lua;/home/debian/.cache/nvim/packer_hererocks/2.1.1741730670/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/debian/.cache/nvim/packer_hererocks/2.1.1741730670/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  LuaSnip = {
    loaded = true,
    path = "/home/debian/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  catppuccin = {
    loaded = true,
    path = "/home/debian/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-buffer"] = {
    loaded = true,
    path = "/home/debian/.local/share/nvim/site/pack/packer/start/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/debian/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-path"] = {
    loaded = true,
    path = "/home/debian/.local/share/nvim/site/pack/packer/start/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/debian/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["csv.vim"] = {
    loaded = true,
    path = "/home/debian/.local/share/nvim/site/pack/packer/start/csv.vim",
    url = "https://github.com/chrisbra/csv.vim"
  },
  ["diffview.nvim"] = {
    loaded = true,
    path = "/home/debian/.local/share/nvim/site/pack/packer/start/diffview.nvim",
    url = "https://github.com/sindrets/diffview.nvim"
  },
  harpoon = {
    config = { "\27LJ\2\n$\0\0\2\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\bcwd\tloop\bvim­\1\1\0\6\0\t\0\0156\0\0\0'\2\1\0B\0\2\2\18\2\0\0009\0\2\0005\3\6\0005\4\3\0003\5\4\0=\5\5\4=\4\a\3B\0\3\0016\0\0\0'\2\b\0B\0\2\1K\0\1\0\19config.harpoon\rsettings\1\0\1\rsettings\0\bkey\0\1\0\3\19save_on_toggle\2\bkey\0\21sync_on_ui_close\2\nsetup\fharpoon\frequire\0" },
    loaded = true,
    path = "/home/debian/.local/share/nvim/site/pack/packer/start/harpoon",
    url = "https://github.com/ThePrimeagen/harpoon"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/debian/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/debian/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/debian/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/debian/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/debian/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["oil.nvim"] = {
    config = { "\27LJ\2\nœ\1\0\0\6\1\b\0\0236\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0006\3\0\0009\3\4\0039\3\5\3-\5\0\0B\3\2\2&\2\3\2B\0\2\0016\0\0\0009\0\1\0'\2\6\0B\0\2\0016\0\0\0009\0\1\0'\2\a\0B\0\2\1K\0\1\0\3€\16startinsert\rterminal\16fnameescape\afn\tlcd \nsplit\bcmd\bvim¾\1\1\0\a\0\n\0\0266\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0029\2\3\0B\2\1\2\15\0\1\0X\3\2€\14\0\2\0X\3\1€2\0\r€\18\3\2\0009\4\4\1\a\4\5\0X\4\3€\18\4\2\0009\5\6\1&\3\5\0046\4\a\0009\4\b\0043\6\t\0B\4\2\0012\0\0€K\0\1\0K\0\1\0\0\rschedule\bvim\tname\14directory\ttype\20get_current_dir\21get_cursor_entry\boil\frequireñ\6\1\0\6\0\23\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0004\3\4\0005\4\3\0>\4\1\0035\4\4\0>\4\2\0035\4\5\0>\4\3\3=\3\a\0025\3\b\0004\4\3\0005\5\t\0>\5\1\0045\5\n\0>\5\2\4=\4\v\3=\3\f\0025\3\r\0005\4\14\0=\4\15\3=\3\16\0025\3\17\0005\4\18\0003\5\19\0=\5\20\4=\4\21\3=\3\22\2B\0\2\1K\0\1\0\fkeymaps\n<C-t>\rcallback\0\1\0\2\tdesc(Open terminal in selected directory\rcallback\0\1\0\14\n<C-a>\23actions.select_tab\n<C-d>\25actions.select_split\6-\19actions.parent\n<C-s>\26actions.select_vsplit\ag.\26actions.toggle_hidden\t<CR>\19actions.select\ag?\22actions.show_help\6_\21actions.open_cwd\agx\26actions.open_external\ags\24actions.change_sort\n<C-r>\20actions.refresh\n<C-t>\0\n<C-c>\18actions.close\n<C-p>\20actions.preview\nfloat\16win_options\1\0\1\rwinblend\3\0\1\0\5\16win_options\0\15max_height\3\20\14max_width\3P\fpadding\3\2\vborder\frounded\17view_options\tsort\1\3\0\0\tname\basc\1\3\0\0\ttype\basc\1\0\2\16show_hidden\2\tsort\0\fcolumns\1\0\6\20delete_to_trash\2\26default_file_explorer\2\nfloat\0\fkeymaps\0\fcolumns\0\17view_options\0\1\2\1\0\nmtime\14highlight\vNumber\1\2\1\0\tsize\14highlight\fSpecial\1\2\1\0\16permissions\14highlight\fComment\nsetup\boil\frequire\0" },
    loaded = true,
    path = "/home/debian/.local/share/nvim/site/pack/packer/start/oil.nvim",
    url = "https://github.com/stevearc/oil.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/debian/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/debian/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    loaded = true,
    path = "/home/debian/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n„\1\0\0\4\0\a\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\5\0'\2\6\0B\0\2\1K\0\1\0\bfzf\19load_extension\rdefaults\1\0\1\rdefaults\0\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/home/debian/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: harpoon
time([[Config for harpoon]], true)
try_loadstring("\27LJ\2\n$\0\0\2\0\3\0\0046\0\0\0009\0\1\0009\0\2\0D\0\1\0\bcwd\tloop\bvim­\1\1\0\6\0\t\0\0156\0\0\0'\2\1\0B\0\2\2\18\2\0\0009\0\2\0005\3\6\0005\4\3\0003\5\4\0=\5\5\4=\4\a\3B\0\3\0016\0\0\0'\2\b\0B\0\2\1K\0\1\0\19config.harpoon\rsettings\1\0\1\rsettings\0\bkey\0\1\0\3\19save_on_toggle\2\bkey\0\21sync_on_ui_close\2\nsetup\fharpoon\frequire\0", "config", "harpoon")
time([[Config for harpoon]], false)
-- Config for: oil.nvim
time([[Config for oil.nvim]], true)
try_loadstring("\27LJ\2\nœ\1\0\0\6\1\b\0\0236\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0006\3\0\0009\3\4\0039\3\5\3-\5\0\0B\3\2\2&\2\3\2B\0\2\0016\0\0\0009\0\1\0'\2\6\0B\0\2\0016\0\0\0009\0\1\0'\2\a\0B\0\2\1K\0\1\0\3€\16startinsert\rterminal\16fnameescape\afn\tlcd \nsplit\bcmd\bvim¾\1\1\0\a\0\n\0\0266\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0029\2\3\0B\2\1\2\15\0\1\0X\3\2€\14\0\2\0X\3\1€2\0\r€\18\3\2\0009\4\4\1\a\4\5\0X\4\3€\18\4\2\0009\5\6\1&\3\5\0046\4\a\0009\4\b\0043\6\t\0B\4\2\0012\0\0€K\0\1\0K\0\1\0\0\rschedule\bvim\tname\14directory\ttype\20get_current_dir\21get_cursor_entry\boil\frequireñ\6\1\0\6\0\23\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0004\3\4\0005\4\3\0>\4\1\0035\4\4\0>\4\2\0035\4\5\0>\4\3\3=\3\a\0025\3\b\0004\4\3\0005\5\t\0>\5\1\0045\5\n\0>\5\2\4=\4\v\3=\3\f\0025\3\r\0005\4\14\0=\4\15\3=\3\16\0025\3\17\0005\4\18\0003\5\19\0=\5\20\4=\4\21\3=\3\22\2B\0\2\1K\0\1\0\fkeymaps\n<C-t>\rcallback\0\1\0\2\tdesc(Open terminal in selected directory\rcallback\0\1\0\14\n<C-a>\23actions.select_tab\n<C-d>\25actions.select_split\6-\19actions.parent\n<C-s>\26actions.select_vsplit\ag.\26actions.toggle_hidden\t<CR>\19actions.select\ag?\22actions.show_help\6_\21actions.open_cwd\agx\26actions.open_external\ags\24actions.change_sort\n<C-r>\20actions.refresh\n<C-t>\0\n<C-c>\18actions.close\n<C-p>\20actions.preview\nfloat\16win_options\1\0\1\rwinblend\3\0\1\0\5\16win_options\0\15max_height\3\20\14max_width\3P\fpadding\3\2\vborder\frounded\17view_options\tsort\1\3\0\0\tname\basc\1\3\0\0\ttype\basc\1\0\2\16show_hidden\2\tsort\0\fcolumns\1\0\6\20delete_to_trash\2\26default_file_explorer\2\nfloat\0\fkeymaps\0\fcolumns\0\17view_options\0\1\2\1\0\nmtime\14highlight\vNumber\1\2\1\0\tsize\14highlight\fSpecial\1\2\1\0\16permissions\14highlight\fComment\nsetup\boil\frequire\0", "config", "oil.nvim")
time([[Config for oil.nvim]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n„\1\0\0\4\0\a\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\0\5\0'\2\6\0B\0\2\1K\0\1\0\bfzf\19load_extension\rdefaults\1\0\1\rdefaults\0\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
