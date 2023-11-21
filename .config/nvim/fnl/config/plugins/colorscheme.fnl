(module config.plugins.colorscheme
  {autoload {core  aniseed.core
             nvim  aniseed.nvim
             tokyo tokyonight}})

(tokyo.setup {:style :moon})

(nvim.ex.colorscheme :tokyonight)

(set nvim.o.background :dark)
