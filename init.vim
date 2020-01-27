set nu
set encoding=utf-8
set ic
set nu
set tabstop=2 shiftwidth=2 expandtab

if (has("termguicolors"))
  set termguicolors
endif

if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif


au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml 
au! BufNewFile,BufReadPost *.{java} set filetype=java
au! BufNewFile,BufReadPost *.{xml} set filetype=xml
au! BufNewFile,BufReadPost *.{json} set filetype=json

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType json setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType xml setlocal ts=2 sts=2 sw=4 expandtab
autocmd FileType java setlocal ts=2 sts=2 sw=2 expandtab
" Coc.nvim
autocmd FileType json syntax match Comment +\/\/.\+$+

call plug#begin('~/_local/share/nvim/plugged')

"
" FZF for search
"
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" for syntax highlighting Scala and sbt source files.
Plug 'derekwyatt/vim-scala'

" Auto Complete
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}

" Tree
Plug 'scrooloose/nerdtree'

" Vim theme
Plug 'drewtempelmeyer/palenight.vim'

Plug 'tomtom/tcomment_vim'

" Surrounds parentheses
Plug 'tpope/vim-surround'
Plug 'tpope/vim-ragtag'

" Vim fugitive for git commands inside vim
Plug 'tpope/vim-fugitive'

" Git diff
Plug 'airblade/vim-gitgutter'

" Vim templates
Plug 'aperezdc/vim-template'

call plug#end()

let g:lightline = { 'colorscheme': 'palenight' }
let g:palenight_terminal_italics=1

let g:ragtag_global_maps = 1

autocmd FileType json syntax match Comment +\/\/.\+$+

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-json',
  \ 'coc-java',
  \ ]

" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#left_sep = ' '
" let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#formatter = 'unique_tail'
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


" Ctrl P triggers fzf search
nnoremap <c-p> :FZF<cr>

let g:netrw_banner = 3
source $HOME/.config/nvim/coc.vim
set shell=/usr/local/bin/zsh

map <Space> <Leader>

nmap <silent> <C-n> :NERDTreeToggle<CR>

noremap <M-CR> :CocAction<CR>

set background=dark
set t_Co=256
colorscheme palenight

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


function! GetCurrentContent()
  let l:content = getline(0,line("$"))
  let l:result = 0
  for l:temp in l:content
    if strlen(l:temp)> 0
      let l:result = 1
      break
    endif
  endfor
  if l:result == 0
    let l:extension = expand("%:c")
    exe 'Template .' . l:extension
  endif
endfunction
autocmd BufEnter * call GetCurrentContent()

function! GetEmailFromEnv()
  return "test"
endfunction

" Used for Vim template
let g:email = $EMAIL
