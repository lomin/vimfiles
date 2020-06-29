" Thx to
" https://github.com/sanitz
" https://github.com/gmarik
" https://github.com/bostonaholic

set nocompatible

let mapleader = ','
let maplocalleader = '´'


if has('vim_starting')
 set nocompatible               " Be iMproved
endif

filetype off

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
nnoremap <leader>l :set list!<CR>
set listchars=tab:▸\ ,eol:¬

nnoremap <silent> <leader>v :vsplit<CR><C-w>l
nnoremap <silent> <leader>s :split<CR><C-w>j
nnoremap <silent> <leader>nt :tabnew<CR><C-w>l

let python_highlight_all = 1
autocmd FileType python map <F10> :w<CR>:!python "%"<CR>

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
" Make sure you use single quotes

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
map <leader>n :NERDTreeToggle<CR>

Plug 'https://github.com/Lokaltog/vim-easymotion'
nmap <leader>f <Plug>(easymotion-s)(
nmap <leader><leader>( <Plug>(easymotion-s)(
nmap <leader>F <Plug>(easymotion-s))
nmap <leader><leader>) <Plug>(easymotion-s))
nmap <leader><leader>[ <Plug>(easymotion-s)[
nmap <leader><leader>] <Plug>(easymotion-s)]

nmap ˆ  <Plug>(sexp_emit_head_element)
nmap º  <Plug>(sexp_emit_tail_element)
nmap ı  <Plug>(sexp_capture_prev_element)
nmap ∆  <Plug>(sexp_capture_next_element)

" Supertab is a vim plugin which allows you to use <Tab> for all your insert completion needs 
Plug 'https://github.com/ervandew/supertab.git'

" apt-get install exuberant-ctags
Plug 'https://github.com/majutsushi/tagbar'
nnoremap <silent> <leader>o :TagbarToggle<CR>

au BufNewFile,BufRead *.clj set filetype=clojure
au BufNewFile,BufRead *.cljs set filetype=clojure
au BufNewFile,BufRead *.hy set filetype=clojure

" Map Clojure to Lisp for ctags"
let g:tagbar_type_clojure = {
             \ 'ctagstype' : 'Lisp',
             \ 'kinds'     : [
                \ 'f:functions:0:0',
            \ ]}
" Static Vim support for Leiningen, Boot, and the Clojure CLI.
Plug 'https://github.com/tpope/vim-salve.git'
Plug 'https://github.com/tpope/vim-dispatch.git'
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'https://github.com/guns/vim-sexp.git'
Plug 'https://github.com/guns/vim-clojure-static.git', { 'for': 'clojure' }
Plug 'liquidz/vim-iced', {'for': 'clojure'}
let g:iced_enable_default_key_mappings = v:true
Plug 'liquidz/vim-iced-kaocha'
Plug 'https://github.com/tpope/vim-sexp-mappings-for-regular-people.git'
" Repeat vim-surround
Plug 'https://github.com/tpope/vim-repeat.git'
Plug 'https://github.com/tpope/vim-surround.git'
" JSON manipulation and pretty printing
Plug 'https://github.com/tpope/vim-jdaddy.git'
Plug 'https://github.com/kien/rainbow_parentheses.vim.git'



" Um schnell die vimrc zu editieren
nnoremap <silent> <leader>my :e! ~/.vimrc<cr>
" gcc          :: Toggle comment for the current line
Plug 'https://github.com/tomtom/tcomment_vim.git'

" Zoom / Restore window.
function! s:ZoomToggle() abort
    if exists('t:zoomed') && t:zoomed
        execute t:zoom_winrestcmd
        let t:zoomed = 0
    else
        let t:zoom_winrestcmd = winrestcmd()
        resize
        vertical resize
        let t:zoomed = 1
    endif
endfunction
command! ZoomToggle call s:ZoomToggle()
map <leader>z :ZoomToggle<CR>

Plug 'https://github.com/vim-scripts/Color-Sampler-Pack.git'
Plug 'https://github.com/altercation/vim-colors-solarized.git'
Plug 'https://github.com/vim-scripts/bufkill.vim'
" Helpers for UNIX 
" :Rename new_name.sh
" :Chmod +x
" :SudoWrite
Plug 'https://github.com/tpope/vim-eunuch.git'
" lean & mean status/tabline for vim that's light as air
Plug 'https://github.com/bling/vim-airline.git'
"
" A command-line fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
nnoremap <C-p> :<C-u>FZF<CR>
set laststatus=2

" An ack.vim alternative mimics Ctrl-Shift-F on Sublime Text 2
Plug 'dyng/ctrlsf.vim'
nmap <C-f> <Plug>CtrlSFPrompt
nmap <C-g> <Plug>CtrlSFPrompt<CR>
vmap <C-g> <Plug>CtrlSFVwordExec

call plug#end()

syntax on

set background=light
let g:solarized_termtrans = 1
colorscheme solarized

filetype plugin on
filetype plugin indent on

command! -complete=file -nargs=1 RM :echo 'Remove: '.'<f-args>'.' '.(delete(<f-args>) == 0 ? 'SUCCEEDED' : 'FAILED')

noremap  <Left> ""
noremap  <Right> ""
nnoremap <Left> <C-b>
nnoremap <Right> <C-f>

map <leader>bd ""

map <leader><Tab> =i(=i[
" map <leader>( =i( 
" map <leader>[ =i[ 

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

noremap <leader>= <c-w>=

inoremap jk <ESC>
"map <leader>yp %yaeP

set clipboard=unnamed
set ruler

au Filetype python setl et ts=4 sw=4

nnoremap <leader>cd :lcd %:p:h<CR>
"
"/ ist nun ein Keyword, um Namespace-unabhängig zu suchen"
au FileType clojure    set isk-=/
au VimEnter * RainbowParenthesesToggle
au Syntax clojure RainbowParenthesesLoadRound
au Syntax clojure RainbowParenthesesLoadSquare
au Syntax clojure RainbowParenthesesLoadBraces

autocmd VimEnter * noremap <c-l> <c-w>l
