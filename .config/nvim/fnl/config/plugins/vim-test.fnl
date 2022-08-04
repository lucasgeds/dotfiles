(module config.plugins.vim-test
  {autoload {nvim aniseed.nvim}})

(let [opts {:noremap true :silent true}]
  (nvim.set_keymap :n :<leader>ta ":TestSuite<CR>"   opts)
  (nvim.set_keymap :n :<leader>tc ":TestNearest<CR>" opts)
  (nvim.set_keymap :n :<leader>tf ":TestFile<CR>"    opts)
  (nvim.set_keymap :n :<leader>tg ":TestVisit<CR>"   opts)
  (nvim.set_keymap :n :<leader>tl ":TestLast<CR>"    opts))

(set nvim.g.test#strategy :neovim)
