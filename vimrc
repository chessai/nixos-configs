set nocompatible

syntax on

runtime macros/matchit.vim
runtime macros/netrw.vim
  
set hidden

set wildmenu

set showcmd

set hlsearch
set incsearch

set ignorecase
set smartcase

set backspace=indent,eol,start

set autoindent

set ruler

set laststatus=2

set confirm

set visualbell

set number

set notimeout ttimeout ttimeoutlen=200

set history=1000

set title

set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set pastetoggle=<F2>

set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>sp :set nolist!<CR>

set shiftwidth=2
set shiftround
set softtabstop=4
set expandtab

map Y y$

nnoremap <C-L> :nohl<CR><C-L>
map <SPACE> <leader>

cmap w!! w !sudo tee % >/dev/null

set t_Co=256
colorscheme colorful256

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

map <Leader>s :SyntasticToggleMode<CR>

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

set autoread

au FocusGained,BufEnter * :silent! !

map <silent> <leader>tw :GhcModTypeInsert<CR>
map <silent> <leader>ts :GhcModSplitFunCase<CR>
map <silent> <leader>tq :GhcModType<CR>
map <silent> <leader>te :GhcModTypeClear<CR>
map <silent> <leader>tc :GhcModCheck<CR>

autocmd BufWritePost *.hs GhcModCheckAndLintAsync

" autocmd FileType rust :packadd rust-vim
" autocmd FileType haskell :packadd ghc-mod
" autocmd FileType haskell :packadd neco-ghc
" autocmd FileType nix :packadd vim-nix

let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDAltDelims_haskell = 1

let g:SuperTabDefaultCompletionType = '<c-x><c-o>'

if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
else " no gui
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<cr>
  endif
endif

let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

map <Leader>n :NERDTreeToggle<CR>

let g:haskell_tabular = 1

vmap a= :Tabularize /=<CR>
vmap a; :Tabularize /::<CR>
vmap a- :Tabularize /-><CR>

map <silent> <Leader>tp :CtrlP()<CR>
noremap <leader>b<space> :CtrlPBuffer<cr>
let g:ctrlp_custom_ignore = '\v[\/]dist$'
