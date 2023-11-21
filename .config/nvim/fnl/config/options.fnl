(module config.options
  {autoload {core aniseed.core
             nvim aniseed.nvim}})

(let [options
      {:backup         false                         ; creates a backup file
       :clipboard      ""                            ; "unnamedplus" allows neovim to access the system clipboard
       :cmdheight      2                             ; more space in the neovim command line for displaying messages
       :colorcolumn    "81"                          ; screen columns that are highlighted
       :completeopt    "menuone,noselect"            ; mostly just for cmp
       :conceallevel   0                             ; so that `` is visible in markdown files
       :cursorline     true                          ; highlight the current line
       :cursorcolumn   true                          ; highlight the screen column of the cursor
       :expandtab      true                          ; convert tabs to spaces
       :fileencoding   "utf-8"                       ; the encoding written to a file
       :guifont        "JetBrainsMono Nerd Font:h16" ; the font used in graphical neovim applications
       :hlsearch       true                          ; highlight all matches on previous search pattern
       :ignorecase     true                          ; ignore case in search patterns
       :mouse          "a"                           ; allow the mouse to be used in neovim
       :number         true                          ; set numbered lines
       :numberwidth    2                             ; set number column width to 2 {default 4}
       :pumheight      10                            ; pop up menu height
       :relativenumber false                         ; set relative numbered lines
       :scrolloff      8                             ; minimal number of screen lines to keep above and below the cursor
       :shiftwidth     2                             ; the number of spaces inserted for each indentation
       :showmode       false                         ; we don't need to see things like ; INSERT ; anymore
       :showtabline    2                             ; always show tabs
       :sidescrolloff  8                             ; minimal number of screen columns to keep to the left and to the right of the cursor if 'nowrap' is set
       :signcolumn     "yes"                         ; always show the sign column otherwise it would shift the text each time
       :smartcase      true                          ; smart case
       :smartindent    true                          ; make indenting smarter again
       :softtabstop    0                             ; number of spaces that a <Tab> counts for while performing editing operations like inserting a <Tab> or using <BS>.
       :splitbelow     true                          ; force all horizontal splits to go below current window
       :splitright     true                          ; force all vertical splits to go to the right of current window
       :swapfile       false                         ; creates a swapfile
       :tabstop        2                             ; insert 2 spaces for a tab
       :termguicolors  true                          ; set term gui colors (most terminals support this)
       :timeoutlen     700                           ; time to wait for a mapped sequence to complete (in milliseconds)
       :undofile       true                          ; enable persistent undo
       :updatetime     300                           ; faster completion (4000ms default)
       :wrap           false                         ; display lines as one long line
       :writebackup    false                         ; if a file is being edited by another program (or was written to file while editing with another program) it is not allowed to be edited
       }]
  (each [option value (pairs options)]
    (core.assoc nvim.o option value)))

(set nvim.g.clojure_align_subforms 1)
(set nvim.g.clojure_fuzzy_indent_patterns ["^with" "^def" "^let" "^flow"])
