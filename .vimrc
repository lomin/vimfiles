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
nmap <silent> <F6> :bn<CR>
nmap <silent> <F7> :bp<CR>

" F8 macht tabs zu whitespaces, entfernt unnütze ws am Ende der Zeile
nnoremap <silent> <F8> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>:retab<CR>

" mit w!! kann man auch als root Dateien speichern
cmap w!! w !sudo tee % >/dev/null

" Um Leerzeichen usw. anzuzeigen, kann man umschalten mit leader+s
nnoremap <leader>s :set list!<CR>
set listchars=tab:▸\ ,eol:¬

nnoremap <silent> <leader>v :vsplit<CR><C-W>l
nnoremap <silent> <leader>nt :tabnew<CR><C-W>l

let python_highlight_all = 1
autocmd FileType python map <F5> :w<CR>:!python2.6 "%"<CR>

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
let g:EasyMotion_leader_key = '<Leader>m'
map <leader>w <Leader>mw
map <leader>e <Leader>me
map <leader>b <Leader>mb

" NERDTree
Bundle 'scrooloose/nerdtree'
nnoremap <leader>T :NERDTree<CR>
nnoremap <leader>t :NERDTreeToggle<CR>
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']

Bundle 'pyflakes.vim'
Bundle 'SuperTab'

Bundle 'pep8'
let g:pep8_map='<leader>p'

" Snipmate
" http://www.vim.org/scripts/script.php?script_id=2540
autocmd FileType python set ft=python.django
autocmd FileType html set ft=htmldjango.html

" Ack
Bundle 'mileszs/ack.vim'
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
nnoremap <leader>a :Ack

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
  map <Leader>z :ZoomWin<CR>

Bundle "git://github.com/tpope/vim-rails.git"
  map <Leader>rc :Rcontroller<Space>
  map <Leader>rv :Rview<Space>
  map <Leader>rm :Rmodel<Space>
  map <Leader>rh :Rhelper<Space>
  map <Leader>rj :Rjavascript<Space>
  map <Leader>rs :Rstylesheet<Space>
  map <Leader>ri :Rintegration<Space>

Bundle "git://github.com/tpope/vim-rake.git"

Bundle "git://github.com/vim-scripts/Color-Sampler-Pack.git"

Bundle "git://github.com/kchmck/vim-coffee-script.git"
  au BufNewFile,BufRead *.coffee set filetype=coffee

Bundle "git://github.com/kien/ctrlp.vim.git"

syntax enable
set background=light
colorscheme sienna
filetype plugin on
filetype plugin indent on

command! -complete=file -nargs=1 RM :echo 'Remove: '.'<f-args>'.' '.(delete(<f-args>) == 0 ? 'SUCCEEDED' : 'FAILED')

noremap  <Left> ""
noremap! <Left> <Esc>
noremap  <Right> ""
noremap! <Right> <Esc>

map <leader><Tab> =i(=i[
map <leader>( =i( 
map <leader>[ =i[ 
