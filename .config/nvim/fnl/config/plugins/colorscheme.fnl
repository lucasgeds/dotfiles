(module config.plugins.colorscheme
  {autoload {core  aniseed.core
             nvim  aniseed.nvim}})

(set nvim.o.background "dark")

(nvim.ex.colorscheme "PaperColor")
