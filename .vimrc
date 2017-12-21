" .vimrc file modified by Yang Dai at MIT
"
" Rebind <Leader> key
let mapleader = ","

" Quick ESC command
imap jk <Esc>

" Replace tabs with spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab

" gets rid of extra space
autocmd BufWritePre * %s/\s\+$//e

" map ctrl n to line numbers
:nmap <C-N><C-N> :set invnumber<CR>

" Showing line numbers and length
set number " show line numbers
set tw=79 " width of document (used by gd)
set nowrap " don't automatically wrap on load
set fo-=t " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=30

" Bind nohl
" Removes highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>

" Quick quit command
noremap <Leader>e :q!<CR> " Quit current window
noremap <Leader>E :qa!<CR> " Quit all windows

" bind Ctrl+<movement> keys to move around the split windows.
map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

" easier moving between tabs
map <Leader>n <esc>:tabprevious<CR>
map <Leader>m <esc>:tabnext<CR>

" easier moving of code blocks for better indentation
vnoremap < <gv
vnoremap > >gv

" Show whitespace
" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
au InsertLeave * match ExtraWhitespace /\s\+$/

" Color scheme
syntax enable
set background=dark
colorscheme solarized

" Make search case insensitive
set hlsearch
set incsearch
set ignorecase
set smartcase

" Disable stupid backup and swap files
set nobackup
set nowritebackup
set noswapfile

" Show the current line
set cursorline

" Pathogen load
filetype off
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on
set nocompatible
set showcmd



" ============================================================================
" Python IDE Setup
" ============================================================================

" Settings for vim-powerline
set laststatus=2
set encoding=utf-8

" Settings for ctrlp
let g:ctrlp_max_height = 10
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

" Settings for python-mode
" map <Leader>g :call RopeGotoDefinition()<CR>
" let ropevim_enable_shortcuts = 1
" let g:pymode_rope_goto_def_newwin = vnew
" let g:pymode_rope_extended_complete = 1
" let g:pymode_breakpoint = 0
" let g:pymode_syntax = 1
" let g:pymode_syntax_builtin_objs = 0
" let g:pymode_syntax_builtin_funcs = 0
" let g:pymode_rope_lookup_project = 0
" map <Leader>b Oimport ipdb; ipdb.set_trace() # BREAKPOINT<C-c>

" Better navigating through omnicomplete option list
set completeopt=longest,menuone
function! OmniPopup(action)
  if pumvisible()
    if a:action == 'j'
      return "\<C-N>"
    elseif a:action == 'k'
      return "\<C-P>"
    endif
  endif
  return a:action
endfunction
inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" Neocomplete
" let g:neocomplete#enable_at_startup = 1
"
set wildmenu
set wildmode=list:longest,full

set clipboard^=unnamed,unnamedplus

" load up the nerd tree
map <Leader>t <plug>NERDTreeTabsToggle<CR>

" move nerdtree to the right
let g:NERDTreeWinPos = "right"
" Chane the size of the nerdtree window
let g:NERDTreeWinSize =30
" " move to the first buffer
autocmd VimEnter * wincmd p

" paste toggle
set pastetoggle=<F2>

" turn off auto complete
" let g:pymode_rope_completion = 0
" let g:pymode_rope_complete_on_dot = 0
