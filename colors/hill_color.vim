" Vim color file

set background=dark
hi clear
if exists("syntax_on")
	syntax reset
endif
let g:colors_name="hill_color"

hi Normal		guifg=grey    guibg=black					        ctermfg=gray    ctermbg=black
hi ErrorMsg		guifg=red     guibg=black						    ctermfg=red     ctermbg=black
hi Visual		guifg=grey    guibg=black  gui=reverse			    ctermfg=grey    ctermbg=black cterm=reverse
hi VisualNOS	guifg=grey    guibg=black  gui=reverse,underline	ctermfg=grey    ctermbg=black cterm=reverse,underline
hi Todo			guifg=green   guibg=black						    ctermfg=green   ctermbg=black
hi Search		guifg=grey    guibg=blue						    ctermfg=grey    ctermbg=blue  
hi IncSearch	guifg=grey    guibg=blue						    ctermfg=grey    ctermbg=blue

hi SpecialKey		guifg=cyan			        ctermfg=cyan
hi Directory		guifg=cyan			        ctermfg=cyan
hi Title			guifg=magenta gui=none      ctermfg=magenta cterm=bold
hi WarningMsg		guifg=red			        ctermfg=red
hi WildMenu			guifg=yellow guibg=black    ctermfg=yellow ctermbg=black cterm=none term=none
hi ModeMsg			guifg=lightblue		        ctermfg=lightblue
hi MoreMsg			ctermfg=darkgreen	        ctermfg=darkgreen
hi Question			guifg=green gui=none        ctermfg=green cterm=none
hi NonText			guifg=blue		            ctermfg=blue

hi StatusLine	guifg=blue  guibg=darkgray gui=none		ctermfg=blue  ctermbg=darkgray term=none cterm=none
hi StatusLineNC	guifg=black guibg=darkgray gui=none		ctermfg=black ctermbg=darkgray term=none cterm=none
hi VertSplit	guifg=black guibg=darkgray gui=none		ctermfg=black ctermbg=darkgray term=none cterm=none

hi Folded	    guifg=darkgrey guibg=black			ctermfg=darkgrey ctermbg=black cterm=bold term=bold
hi FoldColumn	guifg=darkgrey guibg=black			ctermfg=darkgrey ctermbg=black cterm=bold term=bold
hi LineNr	    guifg=green			                ctermfg=green cterm=none

hi DiffAdd	    guibg=darkblue	                    ctermbg=darkblue term=none cterm=none
hi DiffChange	guibg=darkmagenta                   ctermbg=darkmagenta cterm=none
hi DiffDelete	guifg=Blue guibg=DarkCyan gui=bold  ctermfg=blue ctermbg=darkcyan 
hi DiffText	    guibg=Red gui=bold                  ctermbg=red cterm=bold

hi Cursor	guifg=grey guibg=purple    ctermfg=grey ctermbg=5
hi lCursor	guifg=grey guibg=purple    ctermfg=grey ctermbg=5


hi Comment	    guifg=green             ctermfg=green
hi Constant	    guifg=grey              ctermfg=grey    cterm=none
hi Special	    guifg=grey  gui=none    ctermfg=grey    cterm=none 
hi Identifier	guifg=grey              ctermfg=fg      cterm=none
hi Statement	guifg=grey  gui=none    ctermfg=fg      cterm=none
hi PreProc	    guifg=fg    gui=none    ctermfg=fg      cterm=none
hi type		    guifg=fg    gui=none    ctermfg=fg      cterm=none
hi Underlined	                                        cterm=underline term=underline
hi Ignore	    guifg=fg                ctermfg=fg

" suggested by tigmoid, 2008 Jul 18
hi Pmenu        guifg=grey    guibg=black  gui=reverse			    ctermfg=grey    ctermbg=black cterm=reverse
hi PmenuSel     guifg=blue    guibg=grey   gui=reverse			    ctermfg=grey    ctermbg=black cterm=reverse
hi PmenuSbar    guifg=grey    guibg=black  gui=reverse			    ctermfg=grey    ctermbg=black cterm=reverse
hi PmenuThumb   guifg=grey    guibg=black  gui=reverse			    ctermfg=grey    ctermbg=black cterm=reverse

