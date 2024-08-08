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
" Note if you begin to get delays on keys try :verbose map <key>
" look for an extended mapping that vim might be waiting for
let g:abolish_no_mappings = 1
noremap <nowait> c w
vnoremap <nowait> c w
let g:netrw_nogx = 1
noremap <nowait> g b
vnoremap <nowait> g b

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
noremap <nowait> w f
vnoremap <nowait> w f
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

"TAB SETTINGS

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

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
" filetype plugin indent on

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
noremap B :CtrlP<cr>
vnoremap B :CtrlP<cr>
let g:ctrlp_max_depth = 10
let g:ctrlp_max_files = 10000
"make it so ctrlp doesn't jump
let g:ctrlp_switch_buffer = 0
"make it so that ctrlp scans hidden files
let g:ctrlp_show_hidden = 1
" Look for .git to indicate root. If no root, use current dir
let g:ctrlp_working_path_mode = 'ra'
" Exclude files in gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
" Allow interemdiate roots for monorepo
let g:ctrlp_root_markers = ['.root']
"set ctrl-p to ignore the right things
let g:ctrlp_custom_ignore = {
            \ 'dir': '\vbuild|installations|node_modules|dist|\.cache|[\/]\.(git|hg|svn)$',
            \ 'file': '\v\~$|\#$|\.(exe|so|dll|class|aux|log|o|cmake|make|internal|includecache|swp)$',
            \ }
"good information: http://www.reddit.com/r/vim/comments/1a7nmw/ctrlp_vs_e_and_b/

"
" MuComplete
"
set completeopt+=menuone "Required
set completeopt+=noselect  "Required
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion
let g:mucomplete#enable_auto_at_startup = 1

"
"ABOLISH
"
map jr <Plug>(abolish-coerce-word)

"
" Autoindent
"

" Switch off all indenting except autoindent
set nocindent
set nosmartindent
"set noautoindent
set indentexpr=
filetype indent off
filetype plugin indent off
set autoindent


" We are no longer using tags, but leaving this here for reference
" "
" " gutentags
" "
" " https://www.reddit.com/r/vim/comments/d77t6j/guide_how_to_setup_ctags_with_gutentags_properly/
" " enable gtags module
" let g:gutentags_modules = ['ctags', 'gtags_cscope']
" " config project root markers.
" let g:gutentags_add_default_project_roots = 0
" let g:gutentags_project_root = ['.git']
" " generate datebases in my cache directory, prevent gtags files polluting my project
" let g:gutentags_cache_dir = expand('~/.cache/tags')
" " change focus to quickfix window after search (optional).
" let g:gutentags_plus_switch = 1
" let g:gutentags_define_advanced_commands = 1
" let g:gutentags_generate_on_new = 1
" let g:gutentags_generate_on_missing = 1
" let g:gutentags_generate_on_write = 1
" let g:gutentags_generate_on_empty_buffer = 0
" let g:gutentags_ctags_extra_args = [
"       \ '--tag-relative=yes',
"       \ '--fields=+ailmnS',
"       \ ]
" let g:gutentags_ctags_exclude = [
"       \ '*.git', '*.svg', '*.hg',
"       \ '*/tests/*',
"       \ '*/installations/*',
"       \ '*/build/*',
"       \ '*/dist/*',
"       \ '*sites/*/files/*',
"       \ '*/bin/*',
"       \ '*/node_modules/*',
"       \ '*/cache/*',
"       \ '*/compiled/*',
"       \ '*/docs/*',
"       \ '*/example/*',
"       \ '*/bundle/*',
"       \ '*/vendor/*',
"       \ '*.md',
"       \ '*-lock.json',
"       \ '*.lock',
"       \ '*bundle*.js',
"       \ '*build*.js',
"       \ '.*rc*',
"       \ '*.json',
"       \ '*.yaml',
"       \ '*.min.*',
"       \ '*.map',
"       \ '*.bak',
"       \ '*.zip',
"       \ '*.pyc',
"       \ '*.class',
"       \ '*.sln',
"       \ '*.Master',
"       \ '*.csproj',
"       \ '*.tmp',
"       \ '*.csproj.user',
"       \ '*.cache',
"       \ '*.pdb',
"       \ '*/tags/**',
"       \ 'cscope.*',
"       \ '*.css',
"       \ '*.less',
"       \ '*.scss',
"       \ '*.exe', '*.dll',
"       \ '*.mp3', '*.ogg', '*.flac',
"       \ '*.swp', '*.swo',
"       \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
"       \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
"       \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
"       \ ]
" 
" "
" " Taglist
" "
" let Tlist_Ctags_Cmd = expand("~/.vim/ctags/ctags_dedup.sh")
" let tlist_typescript_settings = 'typescript;c:classes;f:functions;i:interfaces'
" " This option doesn't work
" " let Tlist_Show_One_File = 1
" let Tlist_Auto_Highlight_Tag = 0
" " Open the tag list
" nnoremap <silent> <leader>t :TlistToggle<CR>
" " Source code changes
" " 0) Go into the taglist source and remap update to <leader>u and <leader>p/P
" " 1) Add 
"   " set relativenumber
"   " set number
"   " After all the maps are declared
" " 2) Comment out all folding related settings

"
" Text Substitution Macros
"
function! MacAdd() 
  let b:counter = 1
  " while b:counter < line("$")
  let b:mode = 'normal'
  let b:template = []
  let b:argument = []
  let b:offset = 0

  while b:counter <= line("$") + 1
    let b:current_line = getline(b:counter)
    " echo "Current line: "
    " echo b:current_line
    let b:p_match = match(b:current_line, "//#")
    let b:c_match = match(b:current_line, "//")
    " If the line starts with //#
    if b:p_match >= 0
      " If mode is normal 
      if b:mode == 'normal'
        " Change mode to template
        " echo "Entering template mode"
        let b:mode = 'template'
        let b:offset = b:p_match
        " Clear template list
        let b:template = []
      " If mode is template change 
      elseif b:mode == 'template'
        " Change mode to argument
        " echo "Entering argument mode"
        let b:mode = 'argument'
        " Clear argument list
        let b:argument = []
      else
        echo "Error: Cannot have a //# in mode: " . b:mode
        " cursor(b:current_line,1)
        return 
      endif
    " If line starts with //
    elseif b:c_match >= 0
      " If mode is template
      if b:mode == 'template'
        " Accumulate template line
        " echo "Accumulating template"
        let b:x = strpart(b:current_line, b:c_match + 2)
        call add(b:template, b:x)
      " If mode is argument
      elseif b:mode == 'argument'
        " Accumulate argument line
        " echo "Accumulating argument"
        let b:x = strpart(b:current_line, b:c_match + 2)
        call add(b:argument, b:x)
      endif
    " Otherwise
    else
      " If mode is template
      if b:mode == 'template'
        " Echo and abort
        echo "Error: Template must be followed by arguments"
        " cursor(b:current_line,1)
        return
      " If mode is argument
      elseif b:mode == 'argument'
        " Write templates
        " echo "Writing templates"
        let b:lines_inserted = 0
        let b:new_lines = []
        " For each arg list
        for b:arg_line in b:argument
          " echo b:arg_line
          " Split on commas
          let b:arg_line_split = split(b:arg_line,",")
          " If split is not even, echo and abort
          if len(b:arg_line_split) % 2 == 1
            echo "Error: Must provide an even number of args"
            " cursor(b:current_line,1)
            return 
          endif
          " For each string in template
          for b:template_line in b:template
            " Copy the string
            let b:copy = b:template_line
            " For each arg pair
            " echo range(len(b:arg_line_split)/2)
            for b:arg_idx in range(len(b:arg_line_split)/2)
              " Substitute
              let b:from_idx = b:arg_idx * 2
              let b:from = get(b:arg_line_split, b:from_idx)
              let b:pattern = '\C{{' . b:from . '}}'
              " echo b:pattern
              let b:to_idx = b:arg_idx * 2 + 1
              let b:to = get(b:arg_line_split, b:to_idx)
              let b:copy = substitute(b:copy, b:pattern, b:to, 'g')
            endfor
            " echo "Substituted copy:"
            " echo b:copy
            call add(b:new_lines, b:copy)
          endfor
        endfor
        " Get the max length so we can set the location for //!
        let b:max_len = 0
        for b:line in b:new_lines
          if len(b:line) > b:max_len
            let b:max_len = len(b:line)
          endif
        endfor
        " echo "Max len" . b:max_len
        " Append //! to the current string
        let b:new_lines_ended = []
        for b:line in b:new_lines
          let b:opadding = repeat(' ', b:offset)
          let b:ipadding = repeat(' ', b:max_len - len(b:line) + 1)
          let b:line_ended = b:opadding . b:line . b:ipadding . '//!'
          " echo "Line Ended"
          " echo b:line_ended
          call add(b:new_lines_ended, b:line_ended)
        endfor
        " echo b:new_lines_ended
        " Insert the copied string after current_line + lines_inserted
        call append(b:counter - 1, b:new_lines_ended)
        " Set mode to normal
        let b:mode = 'normal'
      endif
    endif
    let b:counter = b:counter + 1
  endwhile
endfunction

function! MacRemove() 
  " echo "Removing lines"
  let b:counter = 1
  while b:counter <= line("$") + 1
    let b:current_line = getline(b:counter)
    call cursor(b:counter, 1)
    let b:match = match(b:current_line, "//!")

    if b:match >= 0
      d
    else
      let b:counter = b:counter + 1
    endif
  endwhile 
endfunction

function! MacFold() 
  " echo "Folding lines"
  let b:counter = 1
  let b:fold_start = 0
  let b:fold_end = 0
  while b:counter <= line("$") + 1
    let b:current_line = getline(b:counter)
    call cursor(b:counter, 1)
    let b:match = match(b:current_line, "//!")

    if b:match >= 0 && b:fold_start == 0
      let b:fold_start = b:counter
      let b:fold_end = b:counter
    elseif b:match >=0 && b:fold_start > 0
      let b:fold_end = b:counter
    elseif b:match < 0 && b:fold_start > 0
      exe b:fold_start . ',' . b:fold_end . 'fold'
      let b:fold_start = 0 
      let b:fold_end = 0 
    endif

    let b:counter = b:counter + 1
  endwhile 
endfunction



function! Mac()
  " echo "mac..."
  " Record the initial cursor
  let b:initial_line = line('.')
  " Remove all lines that end in //!
  call MacRemove()
  " Add new lines
  call MacAdd()
  " Go through all the lines again and fold those that end with //##
  call MacFold()
  " Reset the cursor
  call cursor(b:initial_line, 1)
endfunction


"
" VIM-EASY-ALIGN
"
xmap , <Plug>(EasyAlign)
let g:easy_align_delimiters = {
  \ '\': {
  \     'pattern': '\\$',
  \ },
  \ }


"
" TAB NINE
"
set rtp+=~/.vim/bundle/tabnine-vim
