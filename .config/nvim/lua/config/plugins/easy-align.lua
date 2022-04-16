local _2afile_2a = "/Users/lucas.guedes/.config/nvim/fnl/config/plugins/easy-align.fnl"
local _2amodule_name_2a = "config.plugin.easy-align"
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
local nvim = autoload("aniseed.nvim")
do end (_2amodule_locals_2a)["nvim"] = nvim
nvim.set_keymap("x", "ga", "<Plug>(EasyAlign)", {})
nvim.set_keymap("n", "ga", "<Plug>(EasyAlign)", {})
return _2amodule_2a