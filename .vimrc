" eood list of pluggins: https://vimawesome.com
" Use vim-plug to manage pluggins
" curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Install new plugins
" :source %
" :PlugInstall
call plug#begin('~/.vim/plugged')

" fetches https://github.com/sheerun/vim-polyglot
Plug 'sheerun/vim-polyglot'
Plug 'rizzatti/dash.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'roxma/vim-paste-easy'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()

" change the mapleader from \ to space
" everyone else does “¯\_(ツ)_/¯“
let mapleader="\<Space>"

" Quickly edit/reload the vimrc file
nmap <silent> <leader>ev :vs $MYVIMRC<CR>
nmap <silent> <leader>rv :source $MYVIMRC<CR>

nmap <silent> <leader>ts :put =strftime('%Y.%m.%d')<CR>

nmap <silent> <leader>b :e#<CR>
nmap <silent> <leader>gf :e <cfile><cr>

nmap <C-N><C-N> :set invnumber<CR>

" save current file with sudo
cmap w!! w !sudo tee % >/dev/null

" always display status line
set laststatus=2

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Make it obvious where 90 characters is
"set textwidth=90
"set colorcolumn=+1

set ruler
set pastetoggle=<F2>

filetype plugin indent on

"set runtimepath^=~/.vim/bundle/presen.vim,~/.vim/bundle/vim-livedown

" Use netrw instead of NERDTree
" https://shapeshed.com/vim-netrw/
" use :Vex to open and :bd to close
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25

" Vmwiki setup
"let wiki = {}
"let wiki.path = '~/repos/mego22/notes-spreeldy/'
"let wiki.index = 'index'
"let wiki.syntax = 'markdown'
"let wiki.ext = '.md'
"let g:vimwiki_list = [wiki]

" Insert a newline after each specified string (or before if use '!').
" If no arguments, use previous search.
command! -bang -nargs=* -range LineBreakAt <line1>,<line2>call LineBreakAt('<bang>', <f-args>)
function! LineBreakAt(bang, ...) range
  let save_search = @/
  if empty(a:bang)
    let before = ''
    let after = '\ze.'
    let repl = '&\r'
  else
    let before = '.\zs'
    let after = ''
    let repl = '\r&'
  endif
  let pat_list = map(deepcopy(a:000), "escape(v:val, '/\\.*$^~[')")
  let find = empty(pat_list) ? @/ : join(pat_list, '\|')
  let find = before . '\%(' . find . '\)' . after
  " Example: 10,20s/\%(arg1\|arg2\|arg3\)\ze./&\r/ge
  execute a:firstline . ',' . a:lastline . 's/'. find . '/' . repl . '/ge'
  let @/ = save_search
endfunction

if has("autocmd")
  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

endif

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
