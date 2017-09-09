set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
 Plugin 'VundleVim/Vundle.vim'


 Plugin 'Valloric/YouCompleteMe'
 Plugin 'Valloric/ycmd'

 Plugin 'plasticboy/vim-markdown'

 Plugin 'vim-airline/vim-airline'
 Plugin 'tomasr/molokai'
 Plugin 'flazz/vim-colorschemes'
 Plugin 'tpope/vim-sensible'
 Plugin 'octol/vim-cpp-enhanced-highlight'	
 Plugin 'jiangmiao/auto-pairs'
 Plugin 'vim-scripts/taglist.vim'
 Plugin 'scrooloose/nerdcommenter'

 call vundle#end()            

 filetype plugin indent on    " required
" " To ignore plugin indent changes, instead use:
" "filetype plugin on
" "
" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2016 Mar 25
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
set number
set ruler
set shiftwidth=4
set tabstop=4
set autoindent
set noexpandtab 
syntax on
colorscheme desert
filetype on
filetype indent on
set cursorline
set incsearch
set fenc=utf-8

set encoding=utf-8
set fileencodings=ucs-bom,utf8,cp936
set termencoding=utf-8
set fileencoding=utf-8

set softtabstop=4

augroup project
	autocmd!
	autocmd BufRead, BufNewFile *.h, *.c set filetype=c.doxygen
augroup END

set tags=tags
set autochdir

" taglist 的设置
let Tlist_Ctags_Cmd='/usr/bin/ctags'   
let Tlist_Show_One_File=1
let Tlist_OnlyWindow=1
let Tlist_Use_Right_Window=0
let Tlist_Sort_Type='name'
let Tlist_Exit_OnlyWindow=1
let Tlist_Show_Menu=1
let Tlist_Max_Submenu_Items=10
let Tlist_Max_Tag_length=20
let Tlist_Use_SingleClick=0
let Tlist_Auto_Open=0
let Tlist_Close_On_Select=0
let Tlist_File_Fold_Auto_Close=1
let Tlist_GainFocus_On_ToggleOpen=0
let Tlist_Process_File_Always=1
let Tlist_WinHeight=10
let Tlist_WinWidth=18
let Tlist_Use_Horiz_Window=0


" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  set undofile		" keep an undo file (undo changes after closing)
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
  " Prevent that the langmap option applies to characters that result from a
  " mapping.  If unset (default), this may break plugins (but it's backward
  " compatible).
  set langnoremap
endif


" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
packadd matchit

"ycm 的配置 "
let g:ycm_global_ycm_extra_conf='/home/manout/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax=1  " c/c++关键字补全"
let g:ycm_confirm_extra_conf=0	"关闭存在多个 ycm_extra_conf.py 时的确认提醒"
let g:ycm_extra_conf_globlist = ['./', '~/.vim/bundle/YouCompleteMe/'] "ycm_extra_conf的搜寻路径"
let g:ycm_auto_trigger = 1		"当输入 . 或 -> 自动弹出补全"

"ensible.vim - Defaults everyone can agree on
" Maintainer:   Tim Pope <http://tpo.pe/>
" Version:      1.1

if exists('g:loaded_sensible') || &compatible
  finish
else
  let g:loaded_sensible = 'yes'
endif

if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif

" Use :help 'option' to see the documentation for the given option.

set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab

set nrformats-=octal

if !has('nvim') && &ttimeoutlen == -1
  set ttimeout
  set ttimeoutlen=100
endif

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set laststatus=2
set ruler
set wildmenu

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

if v:version > 703 || v:version == 703 &&  has("patch541")
  set formatoptions+=j " Delete comment character when joining commented lines
endif

if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif

if &shell =~# 'fish$' && (v:version < 704 ||v:version == 704 && !has('patch276'))
   set shell=/bin/bash
endif

set autoread

if &history < 1000
  set history=1000
endif
if &tabpagemax < 50
  set tabpagemax=50
endif
if !empty(&viminfo)
   set viminfo^=!
endif
set sessionoptions-=options

" Allow color schemes to do bright colors without forcing bold.
if &t_Co == 8 && $TERM !~#  '^linux\|^Eterm'
  set t_Co=16
endif

" Load matchit.vim, but only if the user  hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==#  ''
  runtime! macros/matchit.vim
endif

inoremap <C-U> <C-G>u<C-U>

colorscheme  candy
" vim:set ft=vim et sw=2:

" 使用特定的字符包围特定区域的函数
let g:wrap_char = ''
function! WrapThem() range
    let lines = getline(a:firstline,a:lastline)
    let maxl = 0
    for l in lines
        let maxl = len(l)>maxl? len(l):maxl
    endfor
    let h = repeat(g:wrap_char, maxl+4)
    for i in range(len(lines))
        let ll = len(lines[i])
        let lines[i] = g:wrap_char . ' ' . lines[i] . repeat(' ', maxl-ll) . ' ' . g:wrap_char
    endfor  
    let result = [h]
    call extend(result, lines)
    call add(result,h)
    execute a:firstline.','.a:lastline . ' d'
    let s = a:firstline-1<0?0:a:firstline-1
    call append(s, result)
endfunction

" add highlighting for function definition in c++
function! EnhanceCppSyntax()
	syn match cppFuncDef "::\~\?\zs\h\w*\ze([^)]*\()\s*\(const\)\?\)\?$"
	hi def link cppFuncDef Special 
endfunction 

autocmd Syntax cpp call EnhanceCppSyntax()


" 设置 vim-enhanced-highlight
let g:cpp_class_scope_highlight=1

let g:cpp_memeber_variable_highlight=1

let g:cpp_class_decl_highlight=1

let g:cpp_experimental_simple_template_highlight=1

let g:cpp_experimental_template_highlight = 1

let g:cpp_concepts_highlights = 1


" Vim color file - corporation_modified
" Generated by http://bytefluent.com/vivify 2017-08-24
set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "corporation_modified"

"hi CTagsGlobalConstant -- no settings --
"hi Ignore -- no settings --
hi Normal guifg=#f9f9ff guibg=#192224 guisp=#192224 gui=NONE ctermfg=189 ctermbg=235 cterm=NONE
"hi CTagsImport -- no settings --
"hi EnumerationValue -- no settings --
"hi Question -- no settings --
"hi EnumerationName -- no settings --
"hi clear -- no settings --
"hi IncSearch guifg=#ffffff guibg=#BD9800 guisp=#BD9800 gui=NONE ctermfg=15 ctermbg=1 cterm=NONE
"hi WildMenu guifg=NONE guibg=#A1A6A8 guisp=#A1A6A8 gui=NONE ctermfg=NONE ctermbg=248 cterm=NONE
"hi SignColumn guifg=#ffffff guibg=#536991 guisp=#536991 gui=NONE ctermfg=15 ctermbg=60 cterm=NONE
"hi SpecialComment guifg=#ffcc00 guibg=NONE guisp=NONE gui=NONE ctermfg=220 ctermbg=NONE cterm=NONE
hi Typedef guifg=#de79ff guibg=NONE guisp=NONE gui=bold ctermfg=177 ctermbg=NONE cterm=bold
hi Title guifg=#f9f9ff guibg=#192224 guisp=#192224 gui=bold ctermfg=189 ctermbg=235 cterm=bold
"hi Folded guifg=#ffffff guibg=#A1A6A8 guisp=#A1A6A8 gui=italic ctermfg=15 ctermbg=248 cterm=NONE
"hi PreCondit guifg=#ffcc00 guibg=NONE guisp=NONE gui=NONE ctermfg=220 ctermbg=NONE cterm=NONE
"hi Include guifg=#d3ffaf guibg=NONE guisp=NONE gui=NONE ctermfg=193 ctermbg=NONE cterm=NONE
"hi TabLineSel guifg=#ffffff guibg=#BD9800 guisp=#BD9800 gui=bold ctermfg=15 ctermbg=1 cterm=bold
"hi StatusLineNC guifg=#ffffff guibg=#5E6C70 guisp=#5E6C70 gui=bold ctermfg=15 ctermbg=66 cterm=bold
"hi CTagsMember guifg=#4e8fff guibg=NONE guisp=NONE gui=NONE ctermfg=69 ctermbg=NONE cterm=NONE
"hi NonText guifg=#d7f6ff guibg=NONE guisp=NONE gui=italic ctermfg=195 ctermbg=NONE cterm=NONE
"hi DiffText guifg=NONE guibg=#492224 guisp=#492224 gui=NONE ctermfg=NONE ctermbg=52 cterm=NONE
hi ErrorMsg guifg=#f5fdff guibg=#912C00 guisp=#912C00 gui=NONE ctermfg=195 ctermbg=88 cterm=NONE
hi Debug guifg=#ffcc00 guibg=NONE guisp=NONE gui=NONE ctermfg=220 ctermbg=NONE cterm=NONE
hi PMenuSbar guifg=NONE guibg=#848688 guisp=#848688 gui=NONE ctermfg=NONE ctermbg=102 cterm=NONE
"hi Identifier guifg=#ffcc00 guibg=NONE guisp=NONE gui=NONE ctermfg=220 ctermbg=NONE cterm=NONE
hi Identifier guifg=red
hi SpecialChar guifg=#ffcc00 guibg=NONE guisp=NONE gui=NONE ctermfg=220 ctermbg=NONE cterm=NONE
hi Conditional guifg=#ffcc00 guibg=NONE guisp=NONE gui=bold ctermfg=220 ctermbg=NONE cterm=bold
hi StorageClass guifg=#94b9ff guibg=NONE guisp=NONE gui=bold ctermfg=111 ctermbg=NONE cterm=bold
hi Todo guifg=#f9f9ff guibg=#BD9800 guisp=#BD9800 gui=NONE ctermfg=189 ctermbg=1 cterm=NONE
hi Special guifg=#ffcc00 guibg=NONE guisp=NONE gui=NONE ctermfg=220 ctermbg=NONE cterm=NONE
hi LineNr guifg=#ffcc00 guibg=NONE guisp=NONE gui=NONE ctermfg=220 ctermbg=NONE cterm=NONE
hi StatusLine guifg=#ffffff guibg=#BD9800 guisp=#BD9800 gui=bold ctermfg=15 ctermbg=1 cterm=bold
"hi Label guifg=#ffcc00 guibg=NONE guisp=NONE gui=bold ctermfg=220 ctermbg=NONE cterm=bold
"hi PMenuSel guifg=#ffffff guibg=#BD9800 guisp=#BD9800 gui=NONE ctermfg=15 ctermbg=1 cterm=NONE
"hi Search guifg=#ffffff guibg=#BD9800 guisp=#BD9800 gui=NONE ctermfg=15 ctermbg=1 cterm=NONE
hi CTagsGlobalVariable guifg=#58ff55 guibg=NONE guisp=NONE gui=NONE ctermfg=83 ctermbg=NONE cterm=NONE
hi Delimiter guifg=#ffcc00 guibg=NONE guisp=NONE gui=NONE ctermfg=220 ctermbg=NONE cterm=NONE
"hi Statement guifg=#ffcc00 guibg=NONE guisp=NONE gui=bold ctermfg=220 ctermbg=NONE cterm=bold
hi SpellRare guifg=#f9f9ff guibg=#192224 guisp=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline
hi Comment guifg=#d7f6ff guibg=NONE guisp=NONE gui=italic ctermfg=195 ctermbg=NONE cterm=NONE
hi Character guifg=#f5fdff guibg=NONE guisp=NONE gui=NONE ctermfg=195 ctermbg=NONE cterm=NONE
hi Float guifg=#55ffee guibg=NONE guisp=NONE gui=NONE ctermfg=87 ctermbg=NONE cterm=NONE
hi Number guifg=#55ffee guibg=NONE guisp=NONE gui=NONE ctermfg=87 ctermbg=NONE cterm=NONE
hi Boolean guifg=#ff953e guibg=NONE guisp=NONE gui=NONE ctermfg=215 ctermbg=NONE cterm=NONE
hi Operator guifg=#ff8410 guibg=NONE guisp=NONE gui=bold ctermfg=208 ctermbg=NONE cterm=bold
hi CursorLine guifg=NONE guibg=#222E30 guisp=#222E30 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
hi Union guifg=#ffff00 guibg=NONE guisp=NONE gui=NONE ctermfg=11 ctermbg=NONE cterm=NONE
"hi TabLineFill guifg=#ffffff guibg=#5E6C70 guisp=#5E6C70 gui=bold ctermfg=15 ctermbg=66 cterm=bold
hi WarningMsg guifg=#f5fdff guibg=#912C00 guisp=#912C00 gui=NONE ctermfg=195 ctermbg=88 cterm=NONE
"hi VisualNOS guifg=#ffffff guibg=#F9F9FF guisp=#F9F9FF gui=underline ctermfg=15 ctermbg=189 cterm=underline
"hi DiffDelete guifg=NONE guibg=#192224 guisp=#192224 gui=NONE ctermfg=NONE ctermbg=235 cterm=NONE
hi ModeMsg guifg=#ffffff guibg=#192224 guisp=#192224 gui=bold ctermfg=15 ctermbg=235 cterm=bold
hi CursorColumn guifg=NONE guibg=#222E30 guisp=#222E30 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
hi Define guifg=#ffcc00 guibg=NONE guisp=NONE gui=NONE ctermfg=220 ctermbg=NONE cterm=NONE
hi Function guifg=#4e8fff guibg=NONE guisp=NONE gui=bold ctermfg=69 ctermbg=NONE cterm=bold
"hi FoldColumn guifg=#ffffff guibg=#A1A6A8 guisp=#A1A6A8 gui=italic ctermfg=15 ctermbg=248 cterm=NONE
"hi PreProc guifg=#ffcc00 guibg=NONE guisp=NONE gui=NONE ctermfg=220 ctermbg=NONE cterm=NONE
hi Visual guifg=#ffffff guibg=#F9F9FF guisp=#F9F9FF gui=NONE ctermfg=15 ctermbg=189 cterm=NONE
hi MoreMsg guifg=#ffcc00 guibg=NONE guisp=NONE gui=bold ctermfg=220 ctermbg=NONE cterm=bold
hi SpellCap guifg=#f9f9ff guibg=#192224 guisp=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline
"hi VertSplit guifg=#ffffff guibg=#5E6C70 guisp=#5E6C70 gui=bold ctermfg=15 ctermbg=66 cterm=bold
"hi Exception guifg=#ffcc00 guibg=NONE guisp=NONE gui=bold ctermfg=220 ctermbg=NONE cterm=bold
hi Keyword guifg=#ff953e guibg=NONE guisp=NONE gui=bold ctermfg=215 ctermbg=NONE cterm=bold
hi Type guifg=#ff953e guibg=NONE guisp=NONE gui=bold ctermfg=215 ctermbg=NONE cterm=bold
hi DiffChange guifg=NONE guibg=#492224 guisp=#492224 gui=NONE ctermfg=NONE ctermbg=52 cterm=NONE
hi Cursor guifg=#ffffff guibg=#F9F9F9 guisp=#F9F9F9 gui=NONE ctermfg=15 ctermbg=15 cterm=NONE
hi SpellLocal guifg=#f9f9ff guibg=#192224 guisp=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline
hi Error guifg=#f5fdff guibg=#912C00 guisp=#912C00 gui=NONE ctermfg=195 ctermbg=88 cterm=NONE
hi PMenu guifg=#ffffff guibg=#5E6C70 guisp=#5E6C70 gui=NONE ctermfg=15 ctermbg=66 cterm=NONE
hi SpecialKey guifg=#d7f6ff guibg=NONE guisp=NONE gui=italic ctermfg=195 ctermbg=NONE cterm=NONE
hi Constant guifg=#ff8410 guibg=NONE guisp=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
"hi DefinedName guifg=#fff643 guibg=NONE guisp=NONE gui=NONE ctermfg=227 ctermbg=NONE cterm=NONE
hi Tag guifg=#ffcc00 guibg=NONE guisp=NONE gui=NONE ctermfg=220 ctermbg=NONE cterm=NONE
hi String guifg=#cdffa6 guibg=NONE guisp=NONE gui=NONE ctermfg=193 ctermbg=NONE cterm=NONE
"hi PMenuThumb guifg=NONE guibg=#a4a6a8 guisp=#a4a6a8 gui=NONE ctermfg=NONE ctermbg=248 cterm=NONE
hi MatchParen guifg=#ffcc00 guibg=NONE guisp=NONE gui=bold ctermfg=220 ctermbg=NONE cterm=bold
hi LocalVariable guifg=#dcebff guibg=NONE guisp=NONE gui=NONE ctermfg=189 ctermbg=NONE cterm=NONE
"hi Repeat guifg=#ffcc00 guibg=NONE guisp=NONE gui=bold ctermfg=220 ctermbg=NONE cterm=bold
"hi SpellBad guifg=#f9f9ff guibg=#192224 guisp=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline
"hi CTagsClass guifg=#ffff00 guibg=NONE guisp=NONE gui=NONE ctermfg=11 ctermbg=NONE cterm=NONE
hi Directory guifg=#94b9ff guibg=NONE guisp=NONE gui=bold ctermfg=111 ctermbg=NONE cterm=bold
hi Structure guifg=#94b9ff guibg=NONE guisp=NONE gui=bold ctermfg=111 ctermbg=NONE cterm=bold
"hi Macro guifg=#fff643 guibg=NONE guisp=NONE gui=NONE ctermfg=227 ctermbg=NONE cterm=NONE
hi Underlined guifg=#f9f9ff guibg=#192224 guisp=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline
"hi DiffAdd guifg=NONE guibg=#193224 guisp=#193224 gui=NONE ctermfg=NONE ctermbg=236 cterm=NONE
hi TabLine guifg=#ffffff guibg=#5E6C70 guisp=#5E6C70 gui=bold ctermfg=15 ctermbg=66 cterm=bold
"hi cursorim guifg=#ffffff guibg=#536991 guisp=#536991 gui=NONE ctermfg=15 ctermbg=60 cterm=NONE
