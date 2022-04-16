local _2afile_2a = "/Users/lucas.guedes/.config/nvim/fnl/config/plugins/comment.fnl"
local _2amodule_name_2a = "config.plugins.comment"
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
local comm = autoload("Comment")
do end (_2amodule_locals_2a)["comm"] = comm
comm.setup()
return _2amodule_2a