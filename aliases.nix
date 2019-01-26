{ pkgs, ... }:

{
  environment.interactiveShellInit = ''
    ### GIT 
    alias gs='git status'
    alias git-initial-commit='git commit -m "Creō ā nihilō"'

    ### HASKELL 
    alias drep='ghcid -c "cabal new-repl"'

    ### LS 
    alias ls='ls --color=auto'
    alias ll='ls -la --color=auto'
    alias l.='ls -d .* --color=auto'

    ### CD
    alias dev='cd ~/Development' 
    alias .0='cd .' 
    alias .1='cd ..'
    alias .2='cd ../..'
    alias .3='cd ../../..'
    alias .4='cd ../../../..'
    alias .5='cd ../../../../..'

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

    ### VIM
    alias vi='vim'
    alias svi='sudo vim'
    alias edit='vim'

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
  '';
}
