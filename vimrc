set nocompatible              "" be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-multiple-cursors'
Plugin 'Lokaltog/vim-powerline'
Plugin 'altercation/vim-colors-solarized'
Plugin 'flazz/vim-colorschemes'
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" " plugin on GitHub repo
" Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" " Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" " git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" " The sparkup vim script is in a subdirectory of this repo called vim.
" " Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" " Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}
Plugin 'taglist.vim'
Plugin 'AutoComplPop'
Plugin 'OmniCppComplete'
Plugin 'c.vim'
" " All of your Plugins must be added before the following line
call vundle#end()            " required
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
"
"
"
"


"omnicppcomplete Setting
"
set nocp
filetype plugin on
set completeopt=menu,menuone
let OmniCpp_MayCompleteDot = 1 " autocomplete with 
let OmniCpp_MayCompleteArrow = 1 " autocomplete with ->
let OmniCpp_MayCompleteScope = 1 " autocomplete with ::
let OmniCpp_SelectFirstItem = 2 " select first item (but don't insert)
let OmniCpp_NamespaceSearch = 2 " search namespaces in this and included files
let OmniCpp_ShowPrototypeInAbbr = 1 " show function prototype  in popup window
let OmniCpp_GlobalScopeSearch=1
let OmniCpp_DisplayMode=1

"taglist Setting
"
filetype plugin on
let Tlist_Auto_Open=1
let Tlist_Ctags_Cmd = '/home/shiyan/ctags/bin/ctags'
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Use_Right_Window=1


""altercation/vim-colors-solarized
syntax enable
""set background=dark
""colorscheme solarized
colorscheme darkblue2


"编码
"
set fencs = utf-8,ucs-bom,gbk
set termencoding=utf-8

"字体"
""if has('gui')
set guifont=Courier\ New\ 15 \cANSI 
""endif
"自定义快捷键
map <F10> <Esc> :set nu!<CR>
map <F12> <Esc> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q<CR>
map <F2> :tabnew <CR>
""
set nu!
syntax enable
syntax on
set clipboard+=unnamed
filetype on
filetype indent on
set showmatch
set confirm
set autoindent
set smartindent
set laststatus=2
set lines=35 columns=118

"括号
"

inoremap ( ()<ESC>i
inoremap ) <C-R>=ClosePair(')')<CR>
inoremap [ []<ESC>i
inoremap ] <C-R>=ClosePair(']')<CR>
inoremap { {<CR>}<ESC>O
inoremap } <C-R>=ClosePair('}')<CR>
inoremap < <><ESC>i
inoremap " ""<ESC>i
inoremap ' ''<ESC>i

function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction

"设置tab为4
set tabstop=4
set shiftwidth=4
set softtabstop=4

"配色
hi Pmenu cterm=NONE ctermbg=darkblue ctermfg=white guifg=white guibg=darkblue
hi PmenuSel ctermbg=white ctermfg=white
set cursorline
hi cursorline cterm=underline
""ctermfg=white ctermbg=darkred guibg=darkred guifg=white





"个人设置头
set foldenable
set novisualbell ""不要闪烁
set foldmethod=manual

if version >= 603
	set helplang=cn
	set encoding=utf-8
endif
autocmd BufNewFile *.sh exec ":call SetTitle()"
func SetTitle()
if &filetype == 'sh'
	call setline(1, "\##############################################################")
	call append(line("."), "\#FileName: ".expand("%") )
	call append(line(".")+1, "\#Author: shiyan")
	call append(line(".")+2, "\#Mail: shiyan233@hotmail.com")
	call append(line(".")+3, "\#Created Time:".strftime("%c") )
	call append(line(".")+4, "\##############################################################")
	call append(line(".")+5, "\#!bin/bash")
	call append(line(".")+6, "")
endif	
endfunc
autocmd BufNewFile * normal G


