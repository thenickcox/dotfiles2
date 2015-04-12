set nocompatible
filetype off

" Set , to be leader key
let mapleader = ","

set background=dark
let g:solarized_termtrans = 1
colorscheme solarized

set guifont=Monaco:h13
set guioptions-=T
set hlsearch
let &t_Co=256

set clipboard=unnamed

" Make backspace do that thing it's supposed to do
set backspace=2

" Dont ask to re-read files changed outside vim
set autoread

set rnu "relative line numbers

function! g:ToggleNuMode()
if(&rnu == 1)
set nu
else
set rnu
endif
endfunc

nnoremap <C-L> :call g:ToggleNuMode()<cr>

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

let g:ruby_debugger_progname = 'mvim'

" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-unimpaired'
Bundle 'tpope/vim-repeat'
Bundle 'mileszs/ack.vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'ervandew/supertab'
"req for snipmate
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
"
Bundle 'ZoomWin'
Bundle 'kien/ctrlp.vim'
Bundle 'Rename'

Bundle 'tpope/vim-rails'
Bundle 'thoughtbot/vim-rspec'
Bundle 'kchmck/vim-coffee-script'

" Git diffs in the gutter
Bundle 'airblade/vim-gitgutter'


syntax enable
filetype plugin indent on

set ignorecase

" New buffer at direction
nmap <leader>sh  :leftabove  vnew<CR>
nmap <leader>sl  :rightbelow vnew<CR>
nmap <leader>sk  :leftabove  new<CR>
nmap <leader>sj  :rightbelow new<CR>

" traverse splits
nnoremap <leader>wh <C-w>h
nnoremap <leader>wl <C-w>l
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k

" arrow keys resize windows
nnoremap <UP>    <C-w>+
nnoremap <DOWN>  <C-w>-
nnoremap <LEFT>  <C-w>>
nnoremap <RIGHT> <C-w><

" Ctrl-P settings
let g:ctrlp_max_height = 20
let g:ctrlp_prompt_mappings = {
    \ 'PrtSelectMove("k")':   ['<Tab>'],
    \ }
set wildignore+=*/tmp/*
nnoremap <leader>y :tabe<CR>:CtrlP<CR>
nnoremap <leader>t :CtrlP<CR>

" Toggle line number Ctrl-N
nmap <C-N><C-N> :set invnumber<CR>

" Turn highlighting off after search
nmap <C-h> :nohl<CR>

set foldmethod=indent
set foldlevelstart=99

command Wipetabs :%s/	/  /g
command NoDoubleQuotes :%s/"/'/g

" Random Leader Commands
" Some inspired by r00k: https://github.com/r00k/dotfiles/blob/master/vimrc
nnoremap <leader>W :Wipetabs
nnoremap <leader>a :tabe\|:Ack
nnoremap <leader>g :Git
nnoremap <leader>4 :tabclose<CR>
nnoremap <leader>. :!
nnoremap <leader>; :match ExtraWhitespace /\s\s+$/
nnoremap ; :
nnoremap <leader>Q :NoDoubleQuotes<CR>


" highlight whitespace
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
map N Nzz
map n nzz

" Add thor to syntax
au BufRead,BufNewFile *.thor set filetype=ruby

" Add hamljs to syntax
autocmd BufNewFile,BufRead,BufFilePost *.*.hamljs set filetype=haml

" Set tab to 2 spaces
set softtabstop=2
set shiftwidth=2
set tabstop=2
set expandtab
au FileType html setlocal shiftwidth=2 tabstop=2
au FileType javascript setlocal shiftwidth=2 tabstop=2
au FileType coffee setlocal shiftwidth=2 tabstop=2
au FileType cucumber setlocal shiftwidth=2 tabstop=2
au FileType ruby setlocal shiftwidth=2 tabstop=2

" Change tabs for go files
autocmd FileType go setlocal noexpandtab
au FileType go setlocal shiftwidth=8 tabstop=8

" running rspec from tmux hotness
let s:rspec_tmux_command = "tmux send -t 0.1 'rspec --drb {spec}' Enter"
let g:rspec_command = "!echo " . s:rspec_tmux_command . " && " . s:rspec_tmux_command
nnoremap <leader>rr :silent call RunNearestSpec()<CR><c-L>
nnoremap <leader>rf :silent call RunCurrentSpecFile()<CR><c-L>
nnoremap <leader>rl :silent call RunLastSpec()<CR><c-L>

" Populate args list with files in the quickfix window. Obtained from.. http://stackoverflow.com/questions/5686206/search-replace-using-quickfix-list-in-vim
command! -nargs=0 -bar Qargs execute 'args ' . QuickfixFilenames()
function! QuickfixFilenames()
  " Building a hash ensures we get each buffer only once
  let buffer_numbers = {}
  for quickfix_item in getqflist()
    let buffer_numbers[quickfix_item['bufnr']] = bufname(quickfix_item['bufnr'])
  endfor
  return join(values(buffer_numbers))
endfunction

" Function for swapping splits. Obtained from.. http://stackoverflow.com/questions/2586984/how-can-i-swap-positions-of-two-open-files-in-splits-in-vim
function! MarkWindowSwap()
    let g:markedWinNum = winnr()
endfunction

function! DoWindowSwap()
    "Mark destination
    let curNum = winnr()
    let curBuf = bufnr( "%" )
    exe g:markedWinNum . "wincmd w"
    "Switch to source and shuffle dest->source
    let markedBuf = bufnr( "%" )
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' curBuf
    "Switch to dest and shuffle source->dest
    exe curNum . "wincmd w"
    "Hide and open so that we aren't prompted and keep history
    exe 'hide buf' markedBuf
endfunction

nmap <silent> <leader>mn :call MarkWindowSwap()<CR>
nmap <silent> <leader>ms :call DoWindowSwap()<CR>
""" END SWAPPING SPLITS """

