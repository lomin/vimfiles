" Thx to
" https://github.com/sanitz
" https://github.com/gmarik
" https://github.com/bostonaholic

set nocompatible

filetype off

let mapleader = ','
let maplocalleader = '\'

set enc=utf-8

set backspace=indent,eol,start

set hidden " Buffer wechseln ohne zu speicher ist ok

set wildmenu
set wildmode=list:longest,full
set wildignore=*.pyc

set history=1000

set mouse=a

set number
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set softtabstop=2
set autoindent

set scrolloff=3 " Mindestens drei Zeilen noch anzeigen beim Scrollen

" Für die Suche
set hlsearch
set incsearch
set ignorecase
set smartcase
noremap <F4> :set hlsearch! hlsearch?<CR> " Mit F4 wird die Suche nicht mmehr hervorgehoben

set pastetoggle=<F2> " Vor dem Einfügen von formatierten Text

" Temporäre Dateien sollen woanders liegen, nicht in den Projekten
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

" einfaches Wechseln der Buffer
nmap <silent> <F5> <C-o>
nmap <silent> <F6> <C-i>
nmap <silent> <F7> :bn<CR>
nmap <silent> <F8> :bp<CR>

" F9 macht tabs zu whitespaces, entfernt unnütze ws am Ende der Zeile
nnoremap <silent> <F9> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

" mit w!! kann man auch als root Dateien speichern
cmap w!! w !sudo tee % >/dev/null

" Um Leerzeichen usw. anzuzeigen
nnoremap <leader>f :set list!<CR>
set listchars=tab:▸\ ,eol:¬

nnoremap <silent> <leader>v :vsplit<CR><C-W>l
nnoremap <silent> <leader>s :split<CR><C-W>j
nnoremap <silent> <leader>nt :tabnew<CR><C-W>l

let python_highlight_all = 1
autocmd FileType python map <F10> :w<CR>:!python "%"<CR>

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
Bundle 'gmarik/vundle'

Bundle 'Lokaltog/vim-easymotion'
let g:EasyMotion_leader_key = '<leader>m'
map <leader>w <leader>mw
map <leader>e <leader>me
map <leader>b <leader>mb

" NERDTree
Bundle 'scrooloose/nerdtree'
nnoremap <leader>T :NERDTree<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']

Bundle 'pyflakes.vim'
let g:pyflakes_use_quickfix = 0
Bundle 'SuperTab'

Bundle 'pep8'
let g:pep8_map='<leader>p'

" Snipmate
" http://www.vim.org/scripts/script.php?script_id=2540
autocmd FileType python set ft=python.django
autocmd FileType html set ft=htmldjango.html

" Ack
Bundle 'mileszs/ack.vim'
let g:ackprg="ack -H --nocolor --nogroup --column"
nnoremap <leader>a :Ack! 

" apt-get install exuberant-ctags
Bundle 'majutsushi/tagbar'
nnoremap <silent> <leader>o :TagbarToggle<CR>

Bundle "https://github.com/vim-scripts/VimClojure.git"
let vimclojure#HighlightBuiltins=1
let vimclojure#ParenRainbow=1
au BufNewFile,BufRead *.clj set filetype=clojure
au BufNewFile,BufRead *.cljs set filetype=clojure

" Map Clojure to Lisp for ctags"
let g:tagbar_type_clojure = {
             \ 'ctagstype' : 'Lisp',
             \ 'kinds'     : [
                \ 'f:functions:0:0',
            \ ]}

" Um schnell die vimrc zu editieren
nnoremap <silent> <leader>my :e! ~/.vimrc<cr>

Bundle "git://github.com/tomtom/tcomment_vim.git"

" ZoomWin to fullscreen a particular buffer without losing others
Bundle "git://github.com/vim-scripts/ZoomWin.git"
  map <leader>z :ZoomWin<CR>

Bundle "git://github.com/tpope/vim-rails.git"
  map <leader>rc :Rcontroller<Space>
  map <leader>rv :Rview<Space>
  map <leader>rm :Rmodel<Space>
  map <leader>rh :Rhelper<Space>
  map <leader>rj :Rjavascript<Space>
  map <leader>rs :Rstylesheet<Space>
  map <leader>ri :Rintegration<Space>

Bundle "git://github.com/tpope/vim-rake.git"

Bundle "git://github.com/vim-scripts/Color-Sampler-Pack.git"
Bundle "git://github.com/altercation/vim-colors-solarized.git"

Bundle "git://github.com/kchmck/vim-coffee-script.git"
  au BufNewFile,BufRead *.coffee set filetype=coffee

Bundle "git://github.com/kien/ctrlp.vim.git"

syntax on

set background=light
let g:solarized_termtrans = 1
colorscheme solarized

filetype plugin on
filetype plugin indent on

command! -complete=file -nargs=1 RM :echo 'Remove: '.'<f-args>'.' '.(delete(<f-args>) == 0 ? 'SUCCEEDED' : 'FAILED')

noremap  <Left> ""
noremap  <Right> ""
nnoremap <Left> <C-B>
nnoremap <Right> <C-F>

map <leader><Tab> =i(=i[
map <leader>( =i( 
map <leader>[ =i[ 

map <c-j> <c-w>j
map <c-k> <c-w>k
map <c-l> <c-w>l
map <c-h> <c-w>h

noremap <leader>= <c-w>=

inoremap jk <ESC>

set clipboard=unnamed
set ruler
