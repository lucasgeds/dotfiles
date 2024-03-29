(module config.keymaps
  {autoload {core aniseed.core
             nvim aniseed.nvim
             util aniseed.nvim.util}})

(let [opts      {:noremap true :silent true}
      term_opts {:silent true}]

  ;; Remap space as leader key
  (nvim.set_keymap "" :<space> :<nop> opts)
  (set nvim.g.mapleader " ")
  (set nvim.g.maplocalleader ";")

  ;; Modes
  ;; normal_mode = :n
  ;; insert_mode = :i
  ;; visual_mode = :v
  ;; visual_block_mode = :x
  ;; term_mode = :t
  ;; command_mode = :c

  ;; Better window navigation
  (nvim.set_keymap :n :<C-h> :<C-w>h opts)
  (nvim.set_keymap :n :<C-j> :<C-w>j opts)
  (nvim.set_keymap :n :<C-k> :<C-w>k opts)
  (nvim.set_keymap :n :<C-l> :<C-w>l opts)

  ;; Navigate buffers with Shift+H and Shift+L
  (nvim.set_keymap :n :<S-h>      ":bprevious<CR>" opts)
  (nvim.set_keymap :n :<S-l>      ":bnext<CR>"     opts)
  (nvim.set_keymap :n :<leader>bd ":bdelete<CR>"   opts)
  (nvim.set_keymap :n :<leader>bo ":%bd|e#<CR>"    opts)

  ;; Resize with Shift+arrows
  (nvim.set_keymap :n :<S-Up>    ":resize -2<CR>"          opts)
  (nvim.set_keymap :n :<S-Down>  ":resize +2<CR>"          opts)
  (nvim.set_keymap :n :<S-Left>  ":vertical resize -2<CR>" opts)
  (nvim.set_keymap :n :<S-Right> ":vertical resize +2<CR>" opts)

  ;; Copying and Pasting
  (nvim.set_keymap :i :<C-v> "<ESC>\"+pa" opts) ; Paste text from + register with Ctrl+V in Insert Mode
  (nvim.set_keymap :v :<C-c> "\"+y"       opts) ; Copy selected text to + register with Ctrl+C in Visual Mode
  (nvim.set_keymap :v :p     "\"_dP"      opts) ; Preserve yanked text when pasting in Visual Mode

  (nvim.set_keymap :i :<C-c> "<ESC>:let @+ = expand('%:p')<CR>"                  opts) ; Copy file absolute path to + register in Insert Mode
  (nvim.set_keymap :i :<C-l> "<ESC>:let @+ = expand('%') . '#L' . line('.')<CR>" opts) ; Copy file relative path and line number to + register in Insert Mode
  (nvim.set_keymap :n :<C-c> ":let @+ = expand('%')<CR>"                         opts) ; Copy file relative path to + register in Normal Mode

  ;; Move text up and down
  (nvim.set_keymap :n :<A-j> "<ESC>:m .+1<CR>==gi" opts)
  (nvim.set_keymap :n :<A-k> "<ESC>:m .-2<CR>==gi" opts)
  (nvim.set_keymap :v :J     ":m .+1<CR>=="        opts)
  (nvim.set_keymap :v :K     ":m .-2<CR>=="        opts)
  (nvim.set_keymap :x :J     ":move '>+1<CR>gv-gv" opts)
  (nvim.set_keymap :x :K     ":move '<-2<CR>gv-gv" opts)

  ;; Stay in indent mode
  (nvim.set_keymap :v :< :<gv opts)
  (nvim.set_keymap :v :> :>gv opts)

  ;; Clear highlights pressing enter in Normal Mode
  (nvim.set_keymap :n :<CR> ":noh<CR><CR>" opts)

  ;; Press jk fast to enter in Normal Mode from Insert Mode
  (nvim.set_keymap :i :jk :<ESC> opts)

  ;; Open native file tree Netrw
  ;; (nvim.set_keymap :n :<leader>ex ":Sex 20<CR>" opts)

  ;; Terminal
  ;; Better terminal navigation
  (nvim.set_keymap :t :<C-h> "<C-\\><C-N><C-w>h" term_opts)
  (nvim.set_keymap :t :<C-j> "<C-\\><C-N><C-w>j" term_opts)
  (nvim.set_keymap :t :<C-k> "<C-\\><C-N><C-w>k" term_opts)
  (nvim.set_keymap :t :<C-l> "<C-\\><C-N><C-w>l" term_opts)
  (nvim.set_keymap :t :<C-o> "<C-\\><C-N>"       term_opts)
  (nvim.set_keymap :t :jk    :<ESC>              term_opts)
  )
