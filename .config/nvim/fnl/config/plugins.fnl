(module config.plugins
  {autoload {packer config.plugins.packer}})

;; plugins managed by packer
;; :mod specifies namespace under plugins directory

(packer.use
  ;; base
  :lewis6991/impatient.nvim {}             ; speed up neovim startup
  :olical/aniseed           {}             ; nvim config and plugins in fennel
  :wbthomason/packer.nvim   {:mod :packer} ; have packer manage itself

  ;; colorscheme
  :morhetz/gruvbox            {:mod :colorscheme}
  :nlknguyen/papercolor-theme {:mod :colorscheme}

  ;; status line
  :kyazdani42/nvim-web-devicons {}
  :nvim-lualine/lualine.nvim    {:mod :lualine}

  ;; tree

  ;; telescope
  :nvim-telescope/telescope.nvim {:mod :telescope 
                                  :requires [[:nvim-lua/popup.nvim]
                                             [:nvim-lua/plenary.nvim]]}

  ;; parsing system
  :nvim-treesitter/nvim-treesitter {:run ":TSUpdate"
                                    :mod :treesitter}

  ;; lsp
  :neovim/nvim-lspconfig {:mod :lspconfig}


  ;; autocomplete
  :hrsh7th/nvim-cmp {:mod :cmp
                     :requires [:hrsh7th/cmp-buffer
                                :hrsh7th/cmp-cmdline
                                :hrsh7th/cmp-nvim-lsp
                                :hrsh7th/cmp-path
                                :paterjason/cmp-conjure]}

  ;; text manipulation
  :junegunn/vim-easy-align {:mod :easy-align}
  :numtostr/comment.nvim   {:mod :comment-nvim}

  ;; sexp
  :tpope/vim-repeat                           {}
  :tpope/vim-sexp-mappings-for-regular-people {:mod :sexp}
  :tpope/vim-surround                         {}

  ;; repl
  :clojure-vim/vim-jack-in {}
  :olical/conjure          {:mod :conjure}

  ;; language-specific plugins
  ;; flutter
  :akinsho/flutter-tools.nvim {:requires [[:nvim-lua/plenary.nvim]]}
  )
