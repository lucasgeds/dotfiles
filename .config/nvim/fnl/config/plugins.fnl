(module config.plugins
  {autoload {nvim   aniseed.nvim
             packer config.plugins.packer}})

;; plugins managed by packer
;; :mod specifies namespace under plugins directory

(packer.use
  ;; Base
  :wbthomason/packer.nvim   {:mod :packer} ; have packer manage itself
  :lewis6991/impatient.nvim {}             ; speed up neovim startup
  :olical/aniseed           {}             ; nvim config and plugins in fennel

  ;; Colorschemes
  :morhetz/gruvbox            {:mod :colorscheme}
  :nlknguyen/papercolor-theme {:mod :colorscheme}

  ;; Status Line
  :kyazdani42/nvim-web-devicons {}
  :nvim-lualine/lualine.nvim    {:mod :lualine}

  ;; Telescope
  :nvim-telescope/telescope.nvim {:mod      :telescope
                                  :requires [:nvim-lua/plenary.nvim
                                             :nvim-lua/popup.nvim
                                             :nvim-telescope/telescope-file-browser.nvim
                                             :nvim-telescope/telescope-project.nvim
                                             :nvim-telescope/telescope-smart-history.nvim
                                             :tami5/sqlite.lua]}

  ;; Keybinding hints
  :folke/which-key.nvim {:mod :which-key}

  ;; Parsing System
  :nvim-treesitter/nvim-treesitter {:mod      :treesitter
                                    :requires [:nvim-treesitter/playground]
                                    :run      ":TSUpdate"}

  ;; LSP
  :neovim/nvim-lspconfig {:mod :lspconfig}

  ;; Autocomplete
  :hrsh7th/nvim-cmp {:mod      :cmp
                     :requires [:hrsh7th/cmp-buffer
                                :hrsh7th/cmp-cmdline
                                :hrsh7th/cmp-nvim-lsp
                                :hrsh7th/cmp-path
                                :paterjason/cmp-conjure]}

  ;; Text manipulation
  :junegunn/vim-easy-align {:mod :easy-align}
  :numtostr/comment.nvim   {:mod :comment-nvim}
  :sk1418/HowMuch          {}

  ;; SEXP
  :tpope/vim-repeat                           {}
  :tpope/vim-sexp-mappings-for-regular-people {:mod      :sexp
                                               :requires [:guns/vim-sexp]}
  :tpope/vim-surround                         {}

  ;; Dispatch
  :radenling/vim-dispatch-neovim {:requires [:tpope/vim-dispatch]}

  ;; Testing
  :vim-test/vim-test {:mod :vim-test}

  ;; === Language-specific Plugins

  ;; == Clojure
  ;; REPL
  :clojure-vim/clojure.vim {:mod :clojure-vim}
  :clojure-vim/vim-jack-in {}
  :m00qek/baleia.nvim      {:mod :baleia}
  :olical/conjure          {:mod :conjure}

  ;; == Flutter
  :akinsho/flutter-tools.nvim {:requires [:nvim-lua/plenary.nvim]}

  ;; == Markdown
  :iamcco/markdown-preview.nvim {:run (λ [] (nvim.fn.mkdp#util#install))}
  )
