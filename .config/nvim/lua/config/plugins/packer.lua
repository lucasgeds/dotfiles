local _2afile_2a = "/Users/lucas.guedes/.config/nvim/fnl/config/plugins/packer.fnl"
local _2amodule_name_2a = "config.plugins.packer"
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
local packer, util = autoload("packer"), autoload("packer.util")
do end (_2amodule_locals_2a)["packer"] = packer
_2amodule_locals_2a["util"] = util
local function _1_()
  return util.float({border = "rounded"})
end
packer.init({display = {open_fn = _1_}})
return _2amodule_2a