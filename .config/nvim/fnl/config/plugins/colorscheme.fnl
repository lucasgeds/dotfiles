(module config.plugins.theme
  {autoload {core  aniseed.core
             nvim  aniseed.nvim
             theme github-theme}})

(theme.setup {;:colors {:bg "#1c1b22"}
              :comment_style "italic"
              :hide_inactive_statusline false
              :theme_style "dark"})

; (nvim.ex.hi "ColorColumn guibg=#19181e")
; (nvim.ex.hi "NonText ctermfg=7 guifg=#323138")
; (nvim.ex.hi "EndOfBuffer guifg=#19181e")
; (nvim.ex.hi "Pmenu guibg=#19181e")
; (nvim.ex.hi "VertSplit guifg=#19181e")

(nvim.ex.colorscheme "PaperColor")
(set nvim.o.background "dark")
