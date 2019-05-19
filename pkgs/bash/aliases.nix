{ pkgs, ... }:

{
  environment.interactiveShellInit = ''
    ### GIT 
    alias gc='git clone'
    alias gs='git status'
    alias git-initial-commit='git commit -m "Creō ā nihilō"'
    
    ### HASKELL 
    alias drep='ghcid -c "cabal new-repl"'
    alias nrep='nix-shell --run "ghcid -c cabal new-repl"'
    alias ghc844='nix-shell -p haskell.compiler.ghc844'
    alias ghc863='nix-shell -p haskell.compiler.ghc863'
    alias ghc864='nix-shell -p haskell.compiler.ghc864'

    ### LS 
    alias ls='ls --color=auto'
    alias ll='ls -la --color=auto'
    alias l.='ls -d .* --color=auto'

    ### CD
    alias dev='cd ~/development' 
    alias grove='cd ~/development/grove' 
    alias .0='cd .' 
    alias .1='cd ..'
    alias .2='cd ../..'
    alias .3='cd ../../..'
    alias .4='cd ../../../..'
    alias .5='cd ../../../../..'
    alias .6='cd ../../../../../..'
    alias .7='cd ../../../../../../..'
    alias .8='cd ../../../../../../../..'
    alias .9='cd ../../../../../../../../..'
    alias .10='cd ../../../../../../../../..'
    
    ### GREP
    #alias grep='grep --color=auto'
    #alias egrep='egrep --color=auto'
    #alias fgrep='fgrep --color=auto'

    ### DIFF
    #alias diff='colordiff'

    ### MOUNT
    #alias mount='mount | column -t'

    ### TIME
    alias now='date +"%T"'
    #alias nowtime='now'
    #alias nowdate='date +"%d-%m-%Y"'

    ### PORTS
    alias ports='netstat -tulanp'

    ### SYSTEM PERFORMANCE 
    alias meminfo='free -m -l -t'
    
    # get top process or top 10 processes eating memory
    alias psmem='ps auxf | sort -nr -k 4'
    alias psmem10='ps auxf | sort -nr -k 4 | head -10'

    # get top process eating cpu
    alias pscpu='ps auxf | sort -nr -k 3'
    alias pscpu10='ps auxf | sort -nr -k 3 | head -10'

    # cpu info
    alias cpuinfo='lscpu'

    # get pid
    #pid() {
    #  ps -ef | awk '$8=="$1" {print $2}'
    #}
    #htop_pid {
    #  pid $1 | htop -p
    #}

    ### SUMMONER
    alias summon='~/.local/bin/summon'
    alias grab='~/.local/bin/grab'

    ### MISC
    alias ax='chmod a+x'
    alias gp='sudo openconnect --protocol=gp sentinela.layer3com.com'
    alias unused='~/.local/bin/unused'
    alias knuckles='~/.local/bin/knuckles'
    eval $(thefuck --alias)

    ### extraction
    function extract {
     if [ -z "$1" ]; then
        # display usage if no parameters given
        echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
     else
        if [ -f $1 ] ; then
            # NAME=$\{1%.*\}
            # mkdir $NAME && cd $NAME
            case $1 in
              *.tar.bz2)   tar xvjf ./$1    ;;
              *.tar.gz)    tar xvzf ./$1    ;;
              *.tar.xz)    tar xvJf ./$1    ;;
              *.lzma)      unlzma ./$1      ;;
              *.bz2)       bunzip2 ./$1     ;;
              *.rar)       unrar x -ad ./$1 ;;
              *.gz)        gunzip ./$1      ;;
              *.tar)       tar xvf ./$1     ;;
              *.tbz2)      tar xvjf ./$1    ;;
              *.tgz)       tar xvzf ./$1    ;;
              *.zip)       unzip ./$1       ;;
              *.Z)         uncompress ./$1  ;;
              *.7z)        7z x ./$1        ;;
              *.xz)        unxz ./$1        ;;
              *.exe)       cabextract ./$1  ;;
              *)           echo "extract: '$1' - unknown archive method" ;;
            esac
        else
            echo "$1 - file does not exist"
        fi
     fi
    }

  ### use vi keybindings for commandline
  set -o vi
  '';

  # needed for 'extract' 
  environment.systemPackages = with pkgs; [
    p7zip
    cabextract
  ];
}
