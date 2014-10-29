"inoremap -> insert mode, non recursive map
"vnoremap -> visual mode, non recursive map

"PATHOGEN PLUGIN
call pathogen#infect()
call pathogen#helptags()

"LEADER SETTINGS
let mapleader = ","

"MOVEMENT

"right left
noremap t l
vnoremap t l
noremap h h
vnoremap h h

"end of line/beginning of line
noremap T $
vnoremap T $
noremap H ^
vnoremap H ^

"right word left word
noremap c w
vnoremap c w
let g:netrw_nogx = 1
noremap g b
vnoremap g b

"end of word
noremap l e
vnoremap l e

"pane right pane left 
noremap <silent> C :wincmd l<CR>
noremap <silent> G :wincmd h<CR>

"insert left insert right
noremap n i
vnoremap n i
noremap s a
vnoremap s a

"insert beginning of line, insert end of line
noremap N I
vnoremap N I
noremap S A
vnoremap S A

"up down
noremap u gk
vnoremap u gk
noremap e gj
vnoremap e gj

"page up page down
noremap . <C-f>
vnoremap . <C-f>
noremap p <C-b>
vnoremap p <C-b>

"beginning of file, end of file
noremap P 1G
vnoremap P 1G
noremap > G
vnoremap > G

"new line insert above, new line insert below
noremap o O
vnoremap o O
noremap a o
vnoremap a o

"COPY PASTE

"paste below, paste above
noremap y p
vnoremap y p
noremap Y P
vnoremap Y P

"paste text without new line on new line
noremap <leader>y o<ESC>p
noremap <leader>Y O<ESC>p

"copy
noremap f y
vnoremap f y

"cut
"d is unmapped

"cut and paste instructions:
"Position the cursor where you want to begin cutting.
"Press v (or upper case V if you want to cut whole lines).
"Move the cursor to the end of what you want to cut.
"Press d to cut or y to copy.
"Move to where you would like to paste.
"Press P to paste before the cursor, or p to paste after.


"DELETE
"d is unmapped

"undo/redo
"r is undo , R is redo
noremap r u
vnoremap r u
noremap R <c-r>
vnoremap R <c-r>

"SEARCH AND CLEAR SEARCH
noremap i /
vnoremap i /
noremap I :noh<cr>
vnoremap I :noh<cr>

"to make the damn thing search like emacs (intelligently)
set ignorecase
set smartcase
set incsearch
set hlsearch

"moving forward and backward after searching
noremap E n
vnoremap E n
noremap U N
vnoremap U N

"f and t
"for now we have no t
noremap w f
vnoremap w f
noremap m F
vnoremap m F

"REPLACE

"speed up the iterative search and replace 

"enables g on the end by default
set gdefault

":%s/foo/bar/g
"Find each occurrence of 'foo' (in all lines), and replace it with 'bar'.
":s/foo/bar/g
"Find each occurrence of 'foo' (in the current line only), and replace it with 'bar'.
":%s/foo/bar/gc
"Change each 'foo' to 'bar', but ask for confirmation first.
":%s/\<foo\>/bar/gc
"Change only whole words exactly matching 'foo' to 'bar'; ask for confirmation.
":%s/foo/bar/gci
"Change each 'foo' (case insensitive) to 'bar'; ask for confirmation.
"This may be wanted after using :set noignorecase to make searches case sensitive (the default).
":%s/foo/bar/gcI
"Change each 'foo' (case sensitive) to 'bar'; ask for confirmation.
"This may be wanted after using :set ignorecase to make searches case insensitive.

"REGEX 

"eliminates the crazy vim regex syntax
nnoremap / /\v
vnoremap / /\v

"MATCHING PARENTHESIS

"show matching parenthesis
set showmatch

"moving to the matching parenthesis
nnoremap <tab> %
vnoremap <tab> %

"REGISTERS

"BUFFERS
"to create new windows use :split and :vsplit
"to switch to another buffer use :b and wild mode will help here
"use :bn and :bf to move in the buffer ring
"close a window with :q
"close a buffer with :bd

"but note that this will not switch buffers if the current
"buffer is unsaved, which is why I use 
set hidden

"to create a new window quickly
nnoremap <leader>w <C-w>v<C-w>l

"automatically save the buffer when it looses focuse
:au FocusLost * silent! wa

"FILE LOADING
"use :e to open things
"and note that it by default starts in the directory of the open file
set wildmenu
set wildmode=list:longest,full

"FONT

set guifont=Monaco:h9
set encoding=utf-8

"TAB/INDENT SETTINGS

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

"WRAPPING
set wrap
set linebreak
set nolist

"GRAPHICS SETTINGS

"start scrolling when there are three lines left
set scrolloff=3

"tells vim to display the current editing mode
set showmode

"tells vim to display information about the current command
set showcmd

"no beeping please
set visualbell

"scroll quickly
set ttyfast

"displays line column numbers
set ruler

"set the status line to be always on
set laststatus=2

"engage the relative number ruler
set relativenumber
set number

"COLOR SCHEME

colorscheme hill_color

"display highlight group
nmap <leader>h :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"MISC SETTINGS

"filetype stuff
filetype plugin indent on
syntax on

"eliminate the security hole
set modelines=0

"eliminate the vi compatibility
set nocompatible

"make backspace work like normal application
set backspace=indent,eol,start

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""PLUGINS"""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"general information on how to install is here
"http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

"FAST FILE LOADING (CTRL-P)

noremap b :CtrlPBuffer<cr> 
vnoremap b :CtrlPBuffer<cr>
noremap B :CtrlP<cr>
vnoremap B :CtrlP<cr>

"make it so ctrlp doesn't jump
let g:ctrlp_switch_buffer = 0

"make it so that ctrlp scans hidden files
let g:ctrlp_show_hidden = 1

"set ctrl-p to ignore the write things
"set wildignore+=*.aux,*.log,*.class
let g:ctrlp_custom_ignore = {
            \ 'dir': '\vbuild|[\/]\.(git|hg|svn)$',
            \ 'file': '\v\~$|\#$|\.(exe|so|dll|class|aux|log|o|cmake|make|internal|includecache|swp)$',
            \ }

"good information: http://www.reddit.com/r/vim/comments/1a7nmw/ctrlp_vs_e_and_b/

"NEOCOMPLETE
"https://github.com/Shougo/neocomplete.vim

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()


