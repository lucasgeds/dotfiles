call plug#begin('~/.local/share/nvim/plugged')
  Plug 'scrooloose/nerdtree'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'janko/vim-test'
  Plug 'vim-ruby/vim-ruby'
  Plug 'tpope/vim-commentary'
  Plug 'hashivim/vim-terraform'
  Plug 'elixir-editors/vim-elixir'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'morhetz/gruvbox'
  Plug 'NLKNguyen/papercolor-theme'
  " Plug 'ctrlpvim/ctrlp.vim'
call plug#end()

filetype plugin indent on
syntax on

set background=dark
set guifont=*
set termguicolors

colorscheme gruvbox
let g:airline_theme='gruvbox'

colorscheme PaperColor
let g:airline_theme='papercolor'

set autoindent
set colorcolumn=80
set cursorcolumn
set hlsearch " highlight search by default
set incsearch " find the next match as we type the search
set laststatus=2
set mouse=a
set nowrap
set number
set tabstop=2 shiftwidth=2 expandtab softtabstop=2
set textwidth=80
" set clipboard=unnamedplus

" Open new split panes to right and bottom, which feels more natural than Vim’s default
set splitbelow
set splitright

" Key mapping for window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Copy text to + register with Ctrl+C
:vnoremap <C-c> "+y

" Copy file path to clipboard
nnoremap <C-c> :let @+ = expand("%")<CR>
nnoremap <C-C> :let @+ = expand("%:p")<CR>

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()

" vim-test mappings
let test#strategy = 'basic'
nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>
tmap <C-o> <C-\><C-n>

" Fuzzy-find with fzf
map <C-p> :Files<cr>
nmap <C-p> :Files<cr>
map <C-b> :Buffers<cr>
nmap <C-b> :Buffers<cr>
" View commits in fzf
nmap <Leader>c :Commits<cr>
" File preview in fzf
command! -bang -nargs=? -complete=dir Files
      \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" open a NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree
" map a specific key or shortcut to open NERDTree
map <C-n> :NERDTreeToggle<CR>
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
