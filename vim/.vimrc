"""""""""""""""""""""""""""'
""""""""VIM-PLUG PLUGINS"""""""""""""
""""""""""""""""""""""""""""
" {{{

" Specify a directory for plugins
call plug#begin('~/.vim/bundle')

Plug 'VundleVim/Vundle.vim'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'mattn/emmet-vim'
Plug 'dylanaraps/wal'
Plug 'mhinz/vim-startify'
Plug 'ap/vim-css-color'
Plug 'tpope/vim-surround'
Plug 'ternjs/tern_for_vim'
Plug 'othree/yajs.vim'
Plug 'w0rp/ale'
Plug 'mxw/vim-jsx'
Plug 'prettier/vim-prettier', {
      \'do': 'yarn install',
      \'for':['javascript', 'typescript','css','less','scss','json','markdown','vue','yaml','html']}

" Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'junegunn/seoul256.vim'

call plug#end()


" }}}

"""""""""""""""""""""""""""'
""""""""VUNDLE PLUGINS"""""""""""""
""""""""""""""""""""""""""""
" {{{
"set nocompatible              " be iMproved, required
"filetype off                  " required

"" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"" alternatively, pass a path where Vundle should install plugins
""call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'
"Plugin 'scrooloose/nerdtree'
"Plugin 'scrooloose/nerdcommenter'
""Plugin 'vim-syntastic/syntastic'
"Plugin 'airblade/vim-gitgutter'
"Plugin 'sheerun/vim-polyglot'
"Plugin 'mattn/emmet-vim'
"Plugin 'dylanaraps/wal'
"Plugin 'mhinz/vim-startify'
"Plugin 'ap/vim-css-color'
"Plugin 'tpope/vim-surround'
"Plugin 'ternjs/tern_for_vim'
""Plugin 'Valloric/YouCompleteMe'
"Plugin 'othree/yajs.vim'
"Plugin 'w0rp/ale'
"Plugin 'mxw/vim-jsx'
"Plugin 'prettier/vim-prettier'

" All of your Plugins must be added before the following line
"call vundle#end()            " required
"filetype plugin indent on    " required
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
"}}}

""""""""""""""""""""""""""
""""""" GLOBAL""""""""""""
""""""""""""""""""""""""""
" {{{
let &keywordprg=':help'

syntax on
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete
set textwidth=80
"set textwidth=60
set encoding=utf-8
set fenc=utf-8
set fencs=iso-2022-jp,euc-jp,cp932
set relativenumber
set hidden
set showcmd
set nowrap
set backspace=indent,eol,start
set autoindent
set copyindent
set number
set shiftround
set ignorecase
set smartcase
set hlsearch
set incsearch
set history=1000
set undolevels=1000
set title
set visualbell
set noerrorbells
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set ttyfast
set mouse=
set nocompatible
set backup
set backupdir=~/.vim_backup
set noswapfile
set fileformats=unix,dos,mac
set laststatus=2
set expandtab
set softtabstop=2 tabstop=2 shiftwidth=2
set ruler
set wildignore=*.swp,*.bak
set wildmode=longest,list
" set cursorline " highlight current line
set showmatch  " highlight matching [{()}]
set foldenable " enable folding
set foldlevelstart=10 " open most folds by default
set foldnestmax=10 "10 nested fold max
set foldmethod=manual "fold based on indent level
set modelines=1
set pastetoggle=<F3>

hi vertsplit ctermfg=238 ctermbg=235
hi LineNr ctermfg=237
hi StatusLine ctermfg=235 ctermbg=245
hi StatusLineNC ctermfg=235 ctermbg=237
hi Search ctermbg=58 ctermfg=15
hi Default ctermfg=1
hi clear SignColumn
hi SignColumn ctermbg=235
hi GitGutterAdd ctermbg=235 ctermfg=245
hi GitGutterChange ctermbg=235 ctermfg=245
hi GitGutterDelete ctermbg=235 ctermfg=245
hi GitGutterChangeDelete ctermbg=235 ctermfg=245
hi EndOfBuffer ctermfg=237 ctermbg=235

set statusline=%=%f\ %m\ %P\ 
set fillchars=vert:\ ,stl:\ ,stlnc:\ 
set laststatus=2
set noshowmode
colorscheme seoul256 

" }}}

"""""""""""""""""""""""""""""
"""""KEY BINDINGS""""""""""""
"""""""""""""""""""""""""""""
" {{{
nnoremap <leader>s :update<CR>

nmap <TAB> :bn<CR>
nmap <S-TAB> :bp<CR>

"map leader(-) to edit and source vimrc
let mapleader="-"
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"map jk to go back to normal mode from i
inoremap jk <esc>
inoremap <esc> <nop>

" mapping to execute python code
"nnoremap <buffer> <F9> :exec '!python3' shellescape(@%, 1)<cr>

"mapping to open browser
nnoremap <silent> <F10> :!open %<cr>
nnoremap <silent> <F9> :!open % -a qutebrowser<cr>

" Regex mapping for substituting
noremap <leader>; :%s:::g<Left><Left><Left>
noremap <leader>' :%s:::cg<Left><Left><Left><Left>

" Turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

"=== coc.nvim ==="
nmap <silent> <leader>dd <Plug>(coc-definition)
nmap <silent> <leader>dr <Plug>(coc-references)
nmap <silent> <leader>dj <Plug>(coc-implementation)

" map Ctrl X Ctrl o
" imap <tab><tab> <c-x><c-o>

" }}}

"""""""""""""""""""""""""""""
""""ALE SETTING""""""""
"""""""""""""""""""""""""""""
" {{{
let g:ale_linters = {
\   'javascript': ['eslint']
\}

" }}}

"{{{ Fuzzy search
"Search down into all folders
"fuzzy search
set path+=**
"Displays all matching files when tab complete
set wildmenu
"}}}

"Tweaks for browsing
let g:netrw_banner=0  "disable annoying banner

"{{{  SNIPPETS

" Read an empty HTML template and move cursor to title
nnoremap \html :-1read $HOME/.vim/.skeleton.html<CR>4jwf>a
nnoremap \java :-1read $HOME/.vim/.skeleton.java<CR>2ea
nnoremap \boot :-1read $HOME/.vim/.skeleton.bootstrap<CR>10j2e2li
nnoremap \lorem :-1read $HOME/.vim/.skeleton.lorem<CR>
"}}}

"{{{ NERDTree
" Open nerd tree in current buffer
nmap <silent><leader>k :NERDTreeToggle<cr>
let NERDTreeSortOrder = ['\/$', '\.js*', '\.cpp$', '\.h$', '*']
"}}}

hi LineNr ctermbg=NONE
hi Normal guibg=NONE ctermbg=NONE

""""""""""""""""""""""""
""" CUSTOM FUNCTIONS""""
""""""""""""""""""""""""
" {{{
nnoremap <F2> :call NumberToggle()<cr>

""" FocusMode
function! ToggleFocusMode()
  if (&foldcolumn != 12)
    set laststatus=0
    set numberwidth=10
    set foldcolumn=12
    hi Normal guibg=NONE ctermbg=NONE
    set nonumber
    set norelativenumber
    set noruler
    hi FoldColumn ctermbg=none
    hi LineNr ctermfg=0 ctermbg=none
    hi NonText ctermfg=0
  else
	  set laststatus=2
	  set numberwidth=4
	  set relativenumber
	  set number
    set foldcolumn=0
    set ruler
    execute 'colorscheme ' . g:colors_name
    hi LineNr ctermbg=NONE
    hi Normal guibg=NONE ctermbg=NONE
  endif
endfunc
nnoremap <F1> :call ToggleFocusMode()<cr>
"}}}

" let g:deoplete#enable_at_startup = 1

" vim:foldmethod=marker:foldlevel=0

