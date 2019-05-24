{ config,pkgs,lib,... }:

with lib;

let
  myVim = pkgs.vim_configurable.customize {
    name = "vim";
    vimrcConfig = {
      customRC =
        ''
          set nocompatible

          " nix-prefetch-git shortcut
          command! -nargs=+ NPG call Nix_Prefetch_Git(<f-args>)
          function! Nix_Prefetch_Git(owner, repo, ...)
              " Other fields: url, date, fetchSubmodules
              let fields=['rev', 'sha256']
              let command='nix-prefetch-git git@github.com:' . a:owner . '/' . a:repo
              if a:0 > 0
                  let command.=' --rev ' . a:1
              end
              let command.=' --quiet | grep -E "' . join(fields, '|') . '" | sed -E "s/\s\"(.+)\": \"(.+)\",/\1 = \"\2\";/g"'
              execute ('read! ' . command)
          endfunction

          syntax on
          filetype on
          filetype indent on
          filetype plugin on

          set swapfile
          set backup
          set writebackup
          set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
          set directory^=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

          if !has('gui_running')
              set term=xterm-256color
              set t_Co=256
              let &t_ti.="\e[1 q"
              let &t_SI.="\e[5 q"
              let &t_EI.="\e[1 q"
              let &t_te.="\e[0 q"
              set background=dark
              " colorscheme elflord
          else
              set background=dark
              " colorscheme elflord
          endif

          set encoding=utf-8
          scriptencoding utf-8
          set ffs=unix,dos,mac
          let $LANG='en'
          set nospell spelllang=en_us

          set shortmess+=I       " Disable vim intro screen
          set autoread

          set history=1000
          set undolevels=1000

          set noerrorbells
          set visualbell t_vb=
          
          set mouse-=a

          set number relativenumber
          set nocursorline
          set laststatus=2
          set statusline=buf\ %n:\ \"%F\"%<\ \ \ %m%y%h%w%r\ \ %(%b\ 0x%B%)%=%(col\ %c%)\ \ \ \ %(%l\ /\ %L%)\ \ \ \ %p%%%(\ %)
          set showtabline=2
          set wildmenu     " better command-line completion
          set wildmode=longest:list,full
          set cmdheight=1
          set showcmd      " show partial commands on bottom
          " set nowrap

          set magic
          set showmatch    " matching brace/parens/etc.
          set incsearch hlsearch
          set ignorecase smartcase

          set scrolloff=0

          set list listchars=tab:>-,eol:¬,extends:>,precedes:<
          set modelines=1
          set textwidth=80
          set nrformats=bin,hex " Don't increment octal numbers
          set formatoptions=croqjln

          set autoindent smartindent
          set tabstop=2
          set expandtab softtabstop=2
          set shiftwidth=2
          set smarttab
          set noshiftround
          set cinoptions+=:0L0g0j1J1

          set ttyfast
          set timeout timeoutlen=500
          set ttimeoutlen=0

          set nojoinspaces
          set backspace=indent,eol,start

          set foldmethod=manual
          set foldcolumn=1
          set foldlevelstart=99

          abbreviate xaz <C-r>='abcdefghijklmnopqrstuvwxyz'<CR>
          abbreviate xAZ <C-r>='ABCDEFGHIJKLMNOPQRSTUVWXYZ'<CR>
          abbreviate x09 <C-r>='0123456789'<CR>

          " This is so sad, Vim play Despacito
          iabbrev Despacito <Esc>:!xdg-open https://youtu.be/kJQP7kiw5Fk?t=83<CR>

          " Remove all trailing whitespace
          nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
        '';
      vam.pluginDictionaries = [
        { names = [
            "vim-nix"
            "airline"
            "rainbow_parentheses"
          ];
        }
      ];
    };

  };
in
{
  config = {
    environment = {
      systemPackages = [ myVim ];
      shellAliases.vi = "vim";
      variables.EDITOR = "vim";
    };
    programs.bash.shellAliases = {
      vi = "vim";
      svim = "sudoedit";   
    };
    nixpkgs.config.vim = {
      ftNixSupport = true;
      pythonSupport = true;
    };

  };
}
