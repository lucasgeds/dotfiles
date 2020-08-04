if has('neovim')
  if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
    silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
  call plug#begin('~/.local/share/nvim/plugged')
else
  if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
      \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  endif
  call plug#begin('~/.vim/plugged')
endif
  " General
  Plug 'hashivim/vim-terraform'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'liuchengxu/vim-better-default'
  Plug 'luochen1990/rainbow'
  Plug 'scrooloose/nerdtree'
  Plug 'tpope/vim-commentary'

  " Ruby
  Plug 'vim-ruby/vim-ruby'

  " Elixir
  Plug 'elixir-editors/vim-elixir'
  Plug 'mhinz/vim-mix-format'

  " Clojure
  " Plug 'clojure-vim/acid.nvim', { 'do': ':UpdateRemotePlugins' }
  " Plug 'clojure-vim/vim-jack-in', { 'for' : 'clojure' }
  " Plug 'guns/vim-clojure-highlight', { 'for': 'clojure' }
  " Plug 'guns/vim-clojure-static', { 'for': 'clojure' }
  Plug 'guns/vim-sexp', { 'for': 'clojure' }
  " Plug 'jiangmiao/auto-pairs'
  Plug 'liquidz/vim-iced', {'for': 'clojure'}
  " Plug 'ncm2/float-preview.nvim'
  " Plug 'olical/conjure', { 'tag': 'v4.1.0' }
  " Plug 'radenling/vim-dispatch-neovim', { 'for' : 'clojure' }
  " Plug 'shougo/deoplete.nvim'
  " Plug 'tpope/vim-dispatch', { 'for' : 'clojure' }
  " Plug 'tpope/vim-fireplace'
  " Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-sexp-mappings-for-regular-people', { 'for': 'clojure' }
  " Plug 'tpope/vim-surround'
  " Plug 'venantius/vim-cljfmt'
  " Plug 'w0rp/ale'

  " Testing
  Plug 'janko/vim-test'

  " Graphics
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'morhetz/gruvbox'
  Plug 'NLKNguyen/papercolor-theme'
call plug#end()

runtime! plugin/default.vim

" set autoindent
" set background=dark
set clipboard=
set colorcolumn=81
set cursorcolumn
" set cursorline
" set gcr=a:blinkon0
" set guifont=*
" set hlsearch " highlight search by default
" set incsearch " find the next match as we type the search
" set laststatus=2
" set mouse=nv
" set mousemodel=popup_setpos
" set nowrap
" set number
set norelativenumber
" set ruler
" set scrolloff=5
" set splitbelow " open new split panes to bottom
" set splitright " open new split panes to right
set tabstop=2 shiftwidth=2 expandtab softtabstop=2
" set termguicolors
" set textwidth=80

" Leader: '\', LocalLeader: ','
let mapleader='\'
let maplocalleader=','

colorscheme gruvbox
let g:airline_theme='gruvbox'

colorscheme PaperColor
let g:airline_theme='papercolor'

" rainbow parentheses
let g:rainbow_active = 1

" toggle rainbow parentheses
nmap <silent> <leader>rp :RainbowToggle<CR>

" Key mapping for window navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Copy file path to clipboard
nnoremap <C-c> :let @+ = expand("%")<CR>
nnoremap <C-C> :let @+ = expand("%:p")<CR>

vnoremap <C-c> "+y " Copy selected text to + register with Ctrl+C
inoremap <C-v> <ESC>"+pa " Paste text from + register with Ctrl+V in Insert Mode

" " open a NERDTree automatically when vim starts up if no files were specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" " open NERDTree automatically when vim starts up on opening a directory
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" " open a NERDTree automatically when vim starts up
" autocmd vimenter * NERDTree
" map a specific key or shortcut to open NERDTree
map <C-n> :NERDTreeToggle<CR>
" close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

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

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe 'normal mz'
  %s/\s\+$//ge
  exe 'normal `z'
endfunc
autocmd BufWrite * :call DeleteTrailingWS()

" vim-test mappings
let test#strategy = 'basic'
let test#filename_modifier = ':p'
" nmap <silent> <leader>t :TestNearest<CR>
" nmap <silent> <leader>T :TestFile<CR>
" nmap <silent> <leader>a :TestSuite<CR>
" nmap <silent> <leader>l :TestLast<CR>
" nmap <silent> <leader>g :TestVisit<CR>
" tmap <C-o> <C-\><C-n>

" " Run mix format on save for Elixir files
" augroup Elixir
"   autocmd!
"   autocmd BufWritePre <buffer> %!mix format -
" augroup END
" setlocal formatprg=mix\ format\ -
let g:mix_format_on_save = 1
let g:mix_format_silent_errors = 1

" let g:deoplete#enable_at_startup = 1
" call deoplete#custom#option('keyword_patterns', {'clojure': '[\w!$%&*+/:<=>?@\^_~\-\.#]*'})
" set completeopt-=preview

" let g:float_preview#docked = 0
" let g:float_preview#max_width = 80
" let g:float_preview#max_height = 40

" (def clojure-stuff-bellow)
" Enable vim-iced's default key mapping
" This is recommended for newbies
let g:iced_enable_default_key_mappings = v:true

let g:python2_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'
