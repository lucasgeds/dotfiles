(module config.keymaps
  {autoload {nvim aniseed.nvim}})

(let [keymap    nvim.set_keymap
      opts      {:noremap true :silent true}
      term_opts {:silent true}]

  ;; Remap space as leader key
  (keymap "" :<space> :<nop> opts)
  (set nvim.g.mapleader " ")
  (set nvim.g.maplocalleader ";")

  ;; Modes
  ;; normal_mode = :n
  ;; insert_mode = :i
  ;; visual_mode = :v
  ;; visual_block_mode = :x
  ;; term_mode = :t
  ;; command_mode = :c

  ;; Normal
  ;; Better window navigation
  (keymap :n :<C-h> :<C-w>h opts)
  (keymap :n :<C-j> :<C-w>j opts)
  (keymap :n :<C-k> :<C-w>k opts)
  (keymap :n :<C-l> :<C-w>l opts)

  ;; Resize skipping <C-w>
  (keymap :n "[" :<C-w><lt> opts)
  (keymap :n "]" :<C-w>> opts)
  (keymap :n :- :<C-w>- opts)
  (keymap :n :+ :<C-w>+ opts)
  (keymap :n :| :<C-w>| opts)
  (keymap :n :_ :<C-w>_ opts)

  ;; Resize with Shift+arrows
  (keymap :n :<S-Up> ":resize +2<CR>" opts)
  (keymap :n :<S-Down> ":resize -2<CR>" opts)
  (keymap :n :<S-Left> ":vertical resize -2<CR>" opts)
  (keymap :n :<S-Right> ":vertical resize +2<CR>" opts)

  ;; Navigate buffers with Shift+H and Shift+L
  (keymap :n :<S-h> ":bprevious<CR>" opts)
  (keymap :n :<S-l> ":bnext<CR>" opts)

  ; Clear highlighting pressing enter in normal mode
  (keymap :n :<CR> ":noh<CR><CR>" opts)

  ;; Copying and Pasting
  (keymap :n :<C-c> ":let @+ = expand('%:p')<CR>" opts) ; Copy file path to + register in Normal Mode
  (keymap :i :<C-v> "<Esc>\"+pa" opts) ; Paste text from + register with Ctrl+V in Insert Mode
  (keymap :v :<C-c> "\"+y" opts) ; Copy selected text to + register with Ctrl+C in Visual Mode
  (keymap :v :p "\"_dP" opts) ; Preserve yanked text when pasting in Visual Mode

  ;; Open native file tree Netrw
  ;; (keymap :n :<leader>ex ":Sex 20<CR>" opts)

  ;; Press jk fast to enter
  (keymap :i :jk :<ESC> opts)

  ;; Stay in indent mode
  (keymap :v :< :<gv opts)
  (keymap :v :> :>gv opts)

  ;; Move text up and down
  (keymap :n :<A-j> "<Esc>:m .+1<CR>==gi" opts)
  (keymap :n :<A-k> "<Esc>:m .-2<CR>==gi" opts)

  ;; Move text up and down
  (keymap :v :<A-j> ":m .+1<CR>==" opts)
  (keymap :v :<A-k> ":m .-2<CR>==" opts)

  ;; Visual Block
  ;; Move text up and down
  (keymap :x :J ":move '>+1<CR>gv-gv" opts)
  (keymap :x :K ":move '<-2<CR>gv-gv" opts)

  ;; Terminal
  ;; Better terminal navigation
  (keymap :t :<C-h> "<C-\\><C-N><C-w>h" term_opts)
  (keymap :t :<C-j> "<C-\\><C-N><C-w>j" term_opts)
  (keymap :t :<C-k> "<C-\\><C-N><C-w>k" term_opts)
  (keymap :t :<C-l> "<C-\\><C-N><C-w>l" term_opts)
  (keymap :t :<C-o> "<C-\\><C-N>" term_opts)
  (keymap :t :jk :<ESC> opts)
  )
