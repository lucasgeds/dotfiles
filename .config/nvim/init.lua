-- =====================================================================
-- Leader keys (set before lazy.nvim loads plugins)
-- =====================================================================
vim.g.mapleader      = " "
vim.g.maplocalleader = ";"

-- =====================================================================
-- Options
-- =====================================================================
local opt = vim.opt
opt.termguicolors  = true
opt.number         = true
opt.numberwidth    = 2
opt.mouse          = "a"
opt.ignorecase     = true
opt.smartcase      = true
opt.expandtab      = true
opt.tabstop        = 2
opt.shiftwidth     = 2
opt.smartindent    = true
opt.splitbelow     = true
opt.splitright     = true
opt.scrolloff      = 8
opt.sidescrolloff  = 8
opt.signcolumn     = "yes"
opt.undofile       = true
opt.updatetime     = 300
opt.showmode       = true
opt.cursorline     = true
opt.cmdheight      = 1
opt.timeoutlen     = 700
opt.swapfile       = false
opt.wrap           = false

-- =====================================================================
-- Clojure (settings; plugins live below in lazy.setup under the same header)
-- =====================================================================
-- Built-in clojure runtime files read these for indentation
vim.g.clojure_align_subforms        = 1
vim.g.clojure_fuzzy_indent_patterns = { "^with", "^def", "^let", "^flow" }

-- Conjure
vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
vim.g["conjure#client#clojure#nrepl#eval#auto_require"]            = false
vim.g["conjure#client#clojure#nrepl#test#current_form_names"]      = { "deftest", "defflow" }
vim.g["conjure#log#strip_ansi_escape_sequences_line_limit"]        = 0      -- baleia colorizes; don't strip

-- =====================================================================
-- Diagnostics appearance
-- =====================================================================
vim.diagnostic.config({
  signs = { text = {
    [vim.diagnostic.severity.ERROR] = "x",
    [vim.diagnostic.severity.WARN]  = "!",
    [vim.diagnostic.severity.INFO]  = "i",
    [vim.diagnostic.severity.HINT]  = "?",
  } },
  severity_sort    = true,
  update_in_insert = false,
  underline        = true,
  virtual_text     = false,
})

-- =====================================================================
-- Bootstrap lazy.nvim
-- =====================================================================
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none", "--branch=stable",
    "https://github.com/folke/lazy.nvim.git", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- =====================================================================
-- Plugins
-- =====================================================================
require("lazy").setup({
  -- Colorschemes
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = { style = "night" },
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    "f-person/auto-dark-mode.nvim",
    lazy = false,
    priority = 999,
    opts = {
      update_interval = 1000,
      set_dark_mode = function()
        vim.opt.background = "dark"
        vim.cmd.colorscheme("duskfox")
      end,
      set_light_mode = function()
        vim.opt.background = "light"
        vim.cmd.colorscheme("dayfox")
      end,
    },
  },

  -- Syntax highlighting. The `main` branch is a parser installer + query set only:
  -- no module system, and highlighting itself comes from Neovim core. Requires
  -- Neovim 0.12+ and tree-sitter-cli (brew install tree-sitter-cli). Does not
  -- support lazy-loading, hence lazy = false.
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install({
        "clojure", "lua", "vim", "vimdoc", "markdown", "markdown_inline",
        "bash", "json", "yaml", "regex", "sql",
      })

      -- Parser names are not filetypes: vimdoc -> help, bash -> sh.
      -- markdown_inline and regex are injected only, never a buffer's filetype.
      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "clojure", "lua", "vim", "help", "markdown", "sh", "bash", "json", "yaml", "sql" },
        callback = function() vim.treesitter.start() end,
      })
    end,
  },

  -- Browser-based markdown preview
  {
    "iamcco/markdown-preview.nvim",
    ft = "markdown",
    build = function() vim.fn["mkdp#util#install"]() end,
  },

  -- LSP. clojure-lsp installed via Homebrew (on PATH).
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.enable("clojure_lsp")
    end,
  },

  -- Fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
    },
    keys = {
      { "<leader>ff", "<cmd>Telescope find_files<cr>",   desc = "Find files" },
      { "<leader>fg", "<cmd>Telescope live_grep<cr>",    desc = "Live grep" },
      { "<leader>fb", "<cmd>Telescope buffers<cr>",      desc = "Buffers" },
      { "<leader>fh", "<cmd>Telescope help_tags<cr>",    desc = "Help" },
      { "<leader>ft", "<cmd>Telescope file_browser<cr>", desc = "File browser" },
    },
    config = function()
      require("telescope").setup({
        extensions = {
          file_browser = {
            hidden        = true,
            hijack_netrw  = false,
            path          = "%:p:h",
          },
        },
      })
      require("telescope").load_extension("file_browser")
    end,
  },

  {
    "junegunn/vim-easy-align",
    keys = {
      { "ga", "<Plug>(EasyAlign)", mode = { "n", "x" }, desc = "EasyAlign" },
    },
  },

  -- ===================================================================
  -- Clojure
  -- ===================================================================

  -- Colorize ANSI escape sequences in Conjure log buffers.
  -- Eager-loaded so vim.g.conjure_baleia is ready before any clojure file opens.
  {
    "m00qek/baleia.nvim",
    config = function()
      vim.g.conjure_baleia = require("baleia").setup({})
      vim.api.nvim_create_user_command("BaleiaColorize", function()
        vim.g.conjure_baleia.once(vim.api.nvim_get_current_buf())
      end, { bang = true })
    end,
  },

  -- REPL. Autocmd lives in init() so it's registered at startup,
  -- before Conjure itself loads and before any log buffer exists.
  {
    "Olical/conjure",
    ft = { "clojure", "edn", "fennel", "lisp" },
    init = function()
      vim.api.nvim_create_autocmd("BufWinEnter", {
        pattern = "conjure-log-*",
        callback = function(args)
          if vim.g.conjure_baleia then
            vim.g.conjure_baleia.once(args.buf)
            vim.g.conjure_baleia.automatically(args.buf)
          end
        end,
      })
    end,
  },

  -- Structural editing (slurp/barf/raise, paredit-style)
  {
    "julienvincent/nvim-paredit",
    ft = { "clojure", "edn", "fennel", "lisp" },
    config = true,
  },
})

-- =====================================================================
-- Keymaps (non-LSP)
-- =====================================================================
local map  = vim.keymap.set
local kopt = { noremap = true, silent = true }
local topt = { silent = true }

-- Window navigation
map("n", "<C-h>", "<C-w>h", kopt)
map("n", "<C-j>", "<C-w>j", kopt)
map("n", "<C-k>", "<C-w>k", kopt)
map("n", "<C-l>", "<C-w>l", kopt)

-- Buffer navigation
local function close_other_buffers()
  local current = vim.api.nvim_get_current_buf()
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if buf ~= current and vim.bo[buf].buflisted then
      vim.api.nvim_buf_delete(buf, {})
    end
  end
end

map("n", "<S-h>",      ":bprevious<CR>",     kopt)
map("n", "<S-l>",      ":bnext<CR>",         kopt)
map("n", "<leader>bd", ":bdelete<CR>",       kopt)
map("n", "<leader>bo", close_other_buffers,  kopt)

-- Window resize
map("n", "<S-Up>",    ":resize -2<CR>",          kopt)
map("n", "<S-Down>",  ":resize +2<CR>",          kopt)
map("n", "<S-Left>",  ":vertical resize -2<CR>", kopt)
map("n", "<S-Right>", ":vertical resize +2<CR>", kopt)

-- Copy/paste with system clipboard (clipboard option intentionally "")
map("i", "<C-v>", '<ESC>"+pa', kopt)
map("v", "<C-c>", '"+y',       kopt)
map("v", "p",     '"_dP',      kopt)

-- Copy file path/line to clipboard
map("i", "<C-c>", "<ESC>:let @+ = expand('%:p')<CR>",                  kopt)
map("i", "<C-l>", "<ESC>:let @+ = expand('%') . '#L' . line('.')<CR>", kopt)
map("n", "<C-c>", ":let @+ = expand('%')<CR>",                         kopt)

-- Move text up/down
map("n", "<A-j>", "<ESC>:m .+1<CR>==gi", kopt)
map("n", "<A-k>", "<ESC>:m .-2<CR>==gi", kopt)
map("v", "J",     ":m .+1<CR>==",        kopt)
map("v", "K",     ":m .-2<CR>==",        kopt)
map("x", "J",     ":move '>+1<CR>gv-gv", kopt)
map("x", "K",     ":move '<-2<CR>gv-gv", kopt)

-- Indent stays selected
map("v", "<", "<gv", kopt)
map("v", ">", ">gv", kopt)

-- Clear search highlights with Enter
map("n", "<CR>", ":noh<CR><CR>", kopt)

-- jk -> ESC
map("i", "jk", "<ESC>",       kopt)
map("t", "jk", "<C-\\><C-n>", topt)

-- Terminal mode window navigation + exit
map("t", "<C-h>", "<C-\\><C-N><C-w>h", topt)
map("t", "<C-j>", "<C-\\><C-N><C-w>j", topt)
map("t", "<C-k>", "<C-\\><C-N><C-w>k", topt)
map("t", "<C-l>", "<C-\\><C-N><C-w>l", topt)
map("t", "<C-o>", "<C-\\><C-N>",       topt)

-- =====================================================================
-- LSP keymaps (buffer-local on attach)
-- =====================================================================
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local b = { buffer = args.buf, noremap = true, silent = true }
    -- Diagnostics
    map("n", "<leader>le", vim.diagnostic.open_float, b)
    map("n", "<leader>lj", function() vim.diagnostic.jump({ count = 1,  float = true }) end, b)
    map("n", "<leader>lk", function() vim.diagnostic.jump({ count = -1, float = true }) end, b)
    map("n", "<leader>lq", vim.diagnostic.setloclist, b)
    -- LSP actions
    map("n", "<leader>lf", function() vim.lsp.buf.format({ async = true }) end, b)
    map("n", "<leader>lh", vim.lsp.buf.signature_help,  b)
    map("n", "<leader>ln", vim.lsp.buf.rename,          b)
    map("n", "<leader>lt", vim.lsp.buf.type_definition, b)
    map("n", "gd",         vim.lsp.buf.definition,      b)
    map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, b)
    -- Telescope-backed LSP pickers
    map("n", "<leader>lw", function() require("telescope.builtin").diagnostics() end,         b)
    map("n", "<leader>lr", function() require("telescope.builtin").lsp_references() end,      b)
    map("n", "<leader>li", function() require("telescope.builtin").lsp_implementations() end, b)
    -- Auto-format on save if server supports it.
    -- The augroup is buffer-scoped and cleared on each attach, so LspRestart
    -- (or any detach/re-attach) replaces the handler instead of stacking duplicates.
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.documentFormattingProvider then
      local group = vim.api.nvim_create_augroup("LspFormatOnSave_" .. args.buf, { clear = true })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group    = group,
        buffer   = args.buf,
        callback = function() vim.lsp.buf.format({ bufnr = args.buf }) end,
      })
    end
  end,
})

-- =====================================================================
-- Notes
-- =====================================================================
-- Manual override colorscheme any time with `:colorscheme <Tab>`.
-- auto-dark-mode re-asserts on next macOS appearance flip.
-- Available:
--   dayfox / duskfox                            (current default: light / dark)
--   nightfox / nordfox / carbonfox / terafox    (alt dark from nightfox family)
--   dawnfox                                     (alt light from nightfox family)
--   tokyonight-night / tokyonight-storm / tokyonight-moon / tokyonight-day
