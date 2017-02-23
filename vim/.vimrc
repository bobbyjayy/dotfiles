set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree'

Plugin 'vim-syntastic/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" syntastic c++ checker
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"javascript 
let g:syntastic_html_checkers = ['jshint']

" eclim settings
let g:EclimCompletionMethod = 'omnifunc'
let g:EclimFileTypeValidate = 0

set number
set relativenumber
set showcmd

if has("autocmd")
	filetype on
	filetype indent on
	filetype plugin on
endif

syntax enable
set background=dark

"Set text to start a new line after certain width
set textwidth=80

"Automatically indent when adding a curly bracket, etc.
set smartindent

"Error bells are displayed visually
set visualbell

"map leader(-) to edit and source vimrc
let mapleader = "-"
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"map jk to go back to normal mode from i
inoremap jk <esc>
inoremap <esc> <nop>

" mapping to execute python code
nnoremap <buffer> <F9> :exec '!python3' shellescape(@%, 1)<cr>

"mapping to open browser
nnoremap <silent> <F10> :!open %<cr>

"command to indent html accordingly
"autocmd BufWritePre,BufRead *.html :normal gg=G

"short abbreviation to make life easier
"autocmd FileType python :iabbrev <buffer>iff if:<left>
"autocmd FileType python :iabbrev <buffer>re return

"Search down into all folders
"fuzzy search
set path+=**
"Displays all matching files when tab complete
set wildmenu

"Tweaks for browsing
let g:netrw_banner=0  "disable annoying banner

" SNIPPETS:

" Read an empty HTML template and move cursor to title
nnoremap \html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a
nnoremap \java :-1read $HOME/.vim/.skeleton.java<CR>2ea

" Open nerd tree in current buffer
nmap <silent><leader>k :NERDTreeToggle<cr>

