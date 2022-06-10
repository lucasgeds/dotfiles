(module config.plugins
  {autoload {packer config.plugins.packer}})

;; plugins managed by packer
;; :mod specifies namespace under plugins directory

(packer.use
  ;; Base
  :lewis6991/impatient.nvim {}             ; speed up neovim startup
  :wbthomason/packer.nvim   {:mod :packer} ; have packer manage itself
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
                                             :nvim-telescope/telescope-smart-history.nvim]}

  ;; Parsing System
  :nvim-treesitter/nvim-treesitter {:run ":TSUpdate" :mod :treesitter}

  ;; LSP
  :neovim/nvim-lspconfig {:mod :lspconfig}

  ;; Autocomplete
  :hrsh7th/nvim-cmp {:mod :cmp
                     :requires [:hrsh7th/cmp-buffer
                                :hrsh7th/cmp-cmdline
                                :hrsh7th/cmp-nvim-lsp
                                :hrsh7th/cmp-path
                                :paterjason/cmp-conjure]}

  ;; Text manipulation
  :junegunn/vim-easy-align {:mod :easy-align}
  :numtostr/comment.nvim   {:mod :comment-nvim}

  ;; ===== Language-specific Plugins

  ;; ==== Clojure
  ;; REPL
  :clojure-vim/vim-jack-in {}
  :olical/conjure          {:branch :master :mod :conjure}
  ;; SEXP
  :tpope/vim-repeat                           {}
  :tpope/vim-sexp-mappings-for-regular-people {:mod :sexp
                                               :requires [:guns/vim-sexp]}
  :tpope/vim-surround                         {}

  ;; ==== Flutter
  :akinsho/flutter-tools.nvim {:requires [[:nvim-lua/plenary.nvim]]}
  )
