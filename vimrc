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
noremap L E
vnoremap L E

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
noremap u k
vnoremap u k
noremap e j
vnoremap e j

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
noremap W t
vnoremap W t
noremap M T
vnoremap M T

"CHANGE and REPLACE
"jn' will convert this 'hello | world' to this '|'
noremap j c
noremap J C
vnoremap j c
vnoremap J C

noremap k r
noremap K R
vnoremap k r
vnoremap K R

"DELETE CHAR
noremap x x
vnoremap x x
noremap X X
vnoremap X X

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

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

set cino+=(0,W4
set cino+=N-s

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
set colorcolumn=80

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
filetype on
syntax on
filetype plugin indent on

"eliminate the security hole
set modelines=0

"eliminate the vi compatibility
set nocompatible

"make backspace work like normal application
set backspace=indent,eol,start

"disable auto comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""PLUGINS"""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"general information on how to install is here
"http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/

"FAST FILE LOADING (CTRL-P)

noremap b :CtrlPBuffer<cr> 
vnoremap b :CtrlPBuffer<cr>
noremap B :CtrlP ~/<cr>
vnoremap B :CtrlP ~/<cr>
" search deep and wide
" let g:ctrlp_max_depth = 15
" let g:ctrlp_max_files = 100000
"make it so ctrlp doesn't jump
let g:ctrlp_switch_buffer = 0
"make it so that ctrlp scans hidden files
let g:ctrlp_show_hidden = 1
"set ctrl-p to ignore the write things
let g:ctrlp_custom_ignore = {
            \ 'dir': '\vbuild|\.cache|[\/]\.(git|hg|svn)$',
            \ 'file': '\v\~$|\#$|\.(exe|so|dll|class|aux|log|o|cmake|make|internal|includecache|swp)$',
            \ }
"good information: http://www.reddit.com/r/vim/comments/1a7nmw/ctrlp_vs_e_and_b/

"NEOCOMPLETE
"https://github.com/Shougo/neocomplete.vim
" Note This option must be set in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" CPP LINT
let g:cpplint_extensions = "cpp,hpp,h,c,cc,cu,cuh"
let g:cpplint_filter = "-legal/copyright,-build/include_what_you_use"
"autocmd BufWritePost *.cpp,*.hpp,*.h,*.c,*.cc,*.cu,*.cuh call Cpplint()

" TRAILING WHITESPACE
fun! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

autocmd! FileType c,cpp,java,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

" ALWAYS SAVE
" au FocusLost * silent! wa
" set autowriteall
