export CLICOLOR=1;
export TM_SOFT_TABS="NO"
export TM_TAB_SIZE="4"

### Prompt

# @gf3’s Sexy Bash Prompt, inspired by “Extravagant Zsh Prompt”
# Shamelessly copied from https://github.com/gf3/dotfiles
# Screenshot: http://i.imgur.com/s0Blh.png

if [[ $COLORTERM = gnome-* && $TERM = xterm ]] && infocmp gnome-256color >/dev/null 2>&1; then
  export TERM=gnome-256color
elif infocmp xterm-256color >/dev/null 2>&1; then
  export TERM=xterm-256color
fi

if tput setaf 1 &> /dev/null; then
  # next line commented out to prevent garbled textmate output
  # tput sgr0
  if [[ $(tput colors) -ge 256 ]] 2>/dev/null; then
    # Changed these colors to fit Solarized theme
    MAGENTA=$(tput setaf 125)
    ORANGE=$(tput setaf 166)
    GREEN=$(tput setaf 64)
    PURPLE=$(tput setaf 61)
    WHITE=$(tput setaf 244)
  else
    MAGENTA=$(tput setaf 5)
    ORANGE=$(tput setaf 4)
    GREEN=$(tput setaf 2)
    PURPLE=$(tput setaf 1)
    WHITE=$(tput setaf 7)
  fi
  BOLD=$(tput bold)
  RESET=$(tput sgr0)
else
  MAGENTA="\033[1;31m"
  ORANGE="\033[1;33m"
  GREEN="\033[1;32m"
  PURPLE="\033[1;35m"
  WHITE="\033[1;37m"
  BOLD=""
  RESET="\033[m"
fi

export MAGENTA
export ORANGE
export GREEN
export PURPLE
export WHITE
export BOLD
export RESET

function parse_git_dirty() {
  [[ $(git status 2> /dev/null | tail -n1) != *"working tree clean"* ]] && echo "*"
}

function parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}

export PS1="\[${BOLD}${MAGENTA}\]\u \[$WHITE\]at \[$ORANGE\]\h \[$WHITE\]in \[$GREEN\]\w\[$WHITE\]\$([[ -n \$(git branch 2> /dev/null) ]] && echo \" on \")\[$PURPLE\]\$(parse_git_branch)\[$WHITE\]\n⭐️  \[$RESET\]"
export PS2="\[$ORANGE\]→ \[$RESET\]"

# Friday
# https://gist.github.com/sillygwailo/5468997
if [[ $(date +%u) -eq 5 ]]
  then
    export BEER="🍺  "
    export PS1="$PS1$BEER"
  fi

#### Aliases

# git
alias gs='git status '
alias gss='git status --short'
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gk='gitk --all&'
alias gx='gitx --all'
alias gash='git stash '
alias co='git checkout '

alias got='git '
alias get='git '
alias gut='git '

alias diff='diff -w'

alias whoops='git reset --soft HEAD~1'
alias pull='git pull'
alias stash='git stash'
alias unstash='git stash apply'
alias gpod='git push origin develop'
alias gpom='git push origin master'
alias gpo='git push origin '
alias push='git push'


# vagrant
alias vssh='vagrant ssh'
alias burn="echo '🔥   💥   🔥   💥   🚨   🚒' && vagrant destroy"

# fun stuff
alias fc='fortune | cowsay'
alias fcl='fortune | cowsay | lolcat'

# Detect which `ls` flavor is in use
if ls --color > /dev/null 2>&1; then # GNU `ls`
  colorflag="--color"
else # OS X `ls`
  colorflag="-G"
fi

alias activate='source env/bin/activate'

# List all files colorized in long format
alias ll='ls -lh'

# List all files colorized in long format, including dot files
alias la="ls -lha"

# List only directories
alias lsd='ls -l | grep "^d"'

# Always use color output for `ls`
alias ls="command ls ${colorflag}"
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.ogg=01;35:*.mp3=01;35:*.wav=01;35:'