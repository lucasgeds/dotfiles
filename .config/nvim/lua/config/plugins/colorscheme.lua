local _2afile_2a = "/Users/lucas.guedes/.config/nvim/fnl/config/plugins/colorscheme.fnl"
local _2amodule_name_2a = "config.plugin.theme"
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
local core, nvim, theme = autoload("aniseed.core"), autoload("aniseed.nvim"), autoload("github-theme")
do end (_2amodule_locals_2a)["core"] = core
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["theme"] = theme
theme.setup({comment_style = "italic", hide_inactive_statusline = false, theme_style = "dark"})
nvim.ex.colorscheme("PaperColor")
nvim.o.background = "dark"
return _2amodule_2a