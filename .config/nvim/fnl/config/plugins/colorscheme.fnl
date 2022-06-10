(module config.plugins.colorscheme
  {autoload {core  aniseed.core
             nvim  aniseed.nvim}})

(nvim.ex.colorscheme "PaperColor")
(nvim.ex.colorscheme "gruvbox")
(nvim.ex.syntax "on")

(set nvim.o.background "dark")
