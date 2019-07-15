set nu
set tabstop=2
set encoding=utf-8
set ic

if (has("termguicolors"))
  set termguicolors
endif

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif


au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml 
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

call plug#begin('~/_local/share/nvim/plugged')

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'derekwyatt/vim-scala'

Plug 'roxma/nvim-yarp'

Plug 'derekwyatt/vim-scala'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'connorholyday/vim-snazzy'

Plug 'ElmCast/elm-vim'

autocmd FileType json syntax match Comment +\/\/.\+$+

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'

call plug#end()

let g:NERDTreeWinSize=50

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.
let g:fzf_history_dir = '~/.local/share/fzf-history'

" Coc.nvim
autocmd FileType json syntax match Comment +\/\/.\+$+


nnoremap <c-p> :FZF<cr>

let g:netrw_banner = 3
source $HOME/.config/nvim/coc.vim
set shell=/bin/sh

map <Space> <Leader>

inoremap {      {}<Left>
inoremap {<CR>  {<CR>}<Esc>O
inoremap {{     {
inoremap {}     {}
nmap <silent> <C-n> :NERDTreeToggle<CR>

set background=dark
set t_Co=256
colorscheme palenight

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
