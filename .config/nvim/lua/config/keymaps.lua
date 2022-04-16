local _2afile_2a = "/Users/lucas.guedes/.config/nvim/fnl/config/keymaps.fnl"
local _2amodule_name_2a = "config.keymaps"
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
do
  local keymap = nvim.set_keymap
  local opts = {noremap = true, silent = true}
  local term_opts = {silent = true}
  keymap("", "<space>", "<nop>", opts)
  nvim.g.mapleader = " "
  nvim.g.maplocalleader = ";"
  keymap("n", "<C-h>", "<C-w>h", opts)
  keymap("n", "<C-j>", "<C-w>j", opts)
  keymap("n", "<C-k>", "<C-w>k", opts)
  keymap("n", "<C-l>", "<C-w>l", opts)
  keymap("n", "[", "<C-w><lt>", opts)
  keymap("n", "]", "<C-w>>", opts)
  keymap("n", "-", "<C-w>-", opts)
  keymap("n", "+", "<C-w>+", opts)
  keymap("n", "|", "<C-w>|", opts)
  keymap("n", "_", "<C-w>_", opts)
  keymap("n", "<C-Up>", ":resize +2<CR>", opts)
  keymap("n", "<C-Down>", ":resize -2<CR>", opts)
  keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
  keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)
  keymap("n", "<S-l>", ":bnext<CR>", opts)
  keymap("n", "<S-h>", ":bprevious<CR>", opts)
  keymap("n", "<leader>f", ":Lex 20<CR>", opts)
  keymap("n", "<localleader>f", ":Lex 20<CR>", opts)
  keymap("n", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
  keymap("n", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)
  keymap("n", "<C-c>", ":let @+ = expand('%:p')<CR>", opts)
  keymap("i", "<C-v>", "<Esc>\"+pa", opts)
  keymap("v", "<C-c>", "\"+y", opts)
  keymap("v", "p", "\"_dP", opts)
  keymap("i", "jk", "<ESC>", opts)
  keymap("v", "<", "<gv", opts)
  keymap("v", ">", ">gv", opts)
  keymap("v", "<A-j>", ":m .+1<CR>==", opts)
  keymap("v", "<A-k>", ":m .-2<CR>==", opts)
  keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
  keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
  keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
  keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
  keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
  keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
  keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
  keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)
end
return _2amodule_2a