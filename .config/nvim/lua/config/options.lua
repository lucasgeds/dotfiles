local _2afile_2a = "/Users/lucas.guedes/.config/nvim/fnl/config/options.fnl"
local _2amodule_name_2a = "config.options"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local autoload = (require("aniseed.autoload")).autoload
local core, nvim = autoload("aniseed.core"), autoload("aniseed.nvim")
do end (_2amodule_locals_2a)["core"] = core
_2amodule_locals_2a["nvim"] = nvim
do
  local options = {backup = false, clipboard = "", cmdheight = 2, colorcolumn = "81", completeopt = "menuone,noselect", conceallevel = 0, cursorline = true, cursorcolumn = true, expandtab = true, fileencoding = "utf-8", guifont = "monospace:h17", hlsearch = true, ignorecase = true, mouse = "a", number = true, numberwidth = 4, pumheight = 10, relativenumber = false, scrolloff = 8, shiftwidth = 2, showmode = false, showtabline = 2, sidescrolloff = 8, signcolumn = "yes", smartcase = true, smartindent = true, softtabstop = 0, splitbelow = true, splitright = true, swapfile = false, tabstop = 2, termguicolors = true, undofile = true, updatetime = 300, wrap = false, writebackup = false}
  for option, value in pairs(options) do
    core.assoc(nvim.o, option, value)
  end
end
return _2amodule_2a