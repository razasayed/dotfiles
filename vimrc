set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-unimpaired'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-rails'
Plugin 'thoughtbot/vim-rspec'
Plugin 'vim-ruby/vim-ruby'
Plugin 'mileszs/ack.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'ryanss/vim-hackernews'
Plugin 'duff/vim-scratch'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-commentary'
Plugin 'Raimondi/delimitMate'
Plugin 'elzr/vim-json'
Plugin 'kchmck/vim-coffee-script'
Plugin 'tpope/vim-haml'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'scrooloose/syntastic' "To add linting support. For JS linting install jshint using 'npm install -g jshint'
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'

let g:syntastic_check_on_open=1

autocmd StdinReadPre * let s:std_in=1

"Start NerdTree automatically when vim is started
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeMouseMode=3 "single click to open directory in NERDTree. Also opens files in the editor buffer instead of in NERDTree
let NERDTreeWinSize=31
let NERDTreeChDirMode=2 "make sure working directory is set correctly
let g:NERDTreeShowHidden=1
let g:ctrlp_working_path_mode = 0 "set search dir to current instead of project root for ctrlp.Initially was 'rw' (with those single quotes)
"set focus to editor buffer instead of NERDTree when vim starts up.
autocmd VimEnter * if &filetype !=# 'gitcommit' | NERDTree | wincmd p | endif


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


syntax on
set t_Co=256 " set terminal colors to 256.This is already set in iTerm prefs at Profiles->Terminal->Report Terminal Type=xterm-256color. So not sure if this is still needed.
set tw=0 " dont wrap lines automatically after 80 columns
set sw=2 "use 2 spaces for indenting block of text
set number " show line numbers
set noswapfile " do not create swap files
set laststatus=2 " show status bar
set mouse=a " enable mouse use in all modes
set statusline+=%F%=%{fugitive#statusline()} " show full path of current file and current git branch in status bar
set clipboard=unnamed
set autoread "automatically refresh buffer when file changes on disk. Does not work when file is deleted!
set tags=./tags "To use this make sure ctags is installed and a tags file is generated in the project root
"Toggle paste on or off using F2 key. When pasting text from other sources
"into vim turn paste on to preserve indentation of pasted text.
nnoremap <F2> :set invpaste paste?<CR>
set pastetoggle=<F2>
set showmode
set fileformats+=dos "do not add \n automatically to end of file on saving it

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
" let g:rspec_command = 'Dispatch rspec {spec}'
let g:rspec_runner = 'os_x_iterm'

"Uncomment below lines if u want to use solarized color scheme
"set background=dark
"colorscheme solarized
" colorscheme railscasts "http://www.vim.org/scripts/script.php?script_id=2536
colorscheme molokai

" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

"Press \q to close current buffer and return to previous one. Fixes annoying
"bug of vim quitting when one of the buffer in a list of multiple buffers is
"closed
nmap <leader>q :bp <BAR> bd #<CR>

"Navigate between open buffers
map <Leader>e :bnext<CR>
map <Leader>w :bprevious<CR> 

"Omni completion. This makes use of the tags file generated using Exuberant
"ctags so make sure the project root has a tags file
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
