local _2afile_2a = "/Users/lucas.guedes/.config/nvim/fnl/config/plugins.fnl"
local _2amodule_name_2a = "config.plugins"
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
local core, nvim, packer, packer_util = autoload("aniseed.core"), autoload("aniseed.nvim"), autoload("packer"), autoload("packer.util")
do end (_2amodule_locals_2a)["core"] = core
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["packer"] = packer
_2amodule_locals_2a["packer-util"] = packer_util
local function safe_require_plugin_config(name)
  local ok_3f, val_or_err = pcall(require, ("config.plugins." .. name))
  if not ok_3f then
    return print(("config error: " .. val_or_err))
  else
    return nil
  end
end
_2amodule_locals_2a["safe-require-plugin-config"] = safe_require_plugin_config
local function use(...)
  do
    local pkgs = {...}
    local function _2_(use0)
      for i = 1, core.count(pkgs), 2 do
        local name = pkgs[i]
        local opts = pkgs[(i + 1)]
        do
          local _3_ = opts.mod
          if (nil ~= _3_) then
            safe_require_plugin_config(_3_)
          else
          end
        end
        use0(core.assoc(opts, 1, name))
      end
      return nil
    end
    packer.startup(_2_)
  end
  return nil
end
_2amodule_locals_2a["use"] = use
use("wbthomason/packer.nvim", {mod = "packer"}, "Olical/aniseed", {}, "NLKNguyen/papercolor-theme", {mod = "colorscheme"}, "morhetz/gruvbox", {mod = "colorscheme"}, "projekt0n/github-nvim-theme", {mod = "colorscheme"}, "junegunn/vim-easy-align", {mod = "easy-align"}, "numToStr/Comment.nvim", {mod = "comment"}, "lewis6991/impatient.nvim", {})
return _2amodule_2a