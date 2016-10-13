set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Git plugin
Plugin 'tpope/vim-fugitive'

" Syntax checking
Plugin 'scrooloose/syntastic'

" EditorConfig
Plugin 'editorconfig/editorconfig-vim'

" File Explorer
Plugin 'scrooloose/nerdtree'

" Status Line
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'

" Ctrl P to search for stuff
Plugin 'kien/ctrlp.vim'

" LESS syntax highlighting
Plugin 'groenewege/vim-less'

" Code completion
Plugin 'Valloric/YouCompleteMe'

" Yaml indenting
Plugin 'shmay/vim-yaml'

" Dracula theme
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}

Plugin 'altercation/vim-colors-solarized', {'rtp': 'vim/'}

Plugin 'mileszs/ack.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

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
set tabstop=4

" Enable syntaxt highlighting
syntax enable
" Set custom color scheme
colorscheme dracula
" Set vim to show active line number and relative line numbers
set relativenumber
set number
" Open nerdtree if no file was specified on command line
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Map Ctrl+n to NerdTree
map <C-n> :NERDTreeToggle<CR>

" Map Ctrl+M to next buffer
map <C-m> :bnext<CR>

" Syntastic Config
" Enable syntastic checkers for different files.
let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_less_checkers = ['recess']

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Ctrl-P config
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'

" airline config
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#mixed_indent_algo = 0
let g:airline#extensions#tabline#show_tab_type = 1

" Set font for MacVim
set guifont=Hack:h12
