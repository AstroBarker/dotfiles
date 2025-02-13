#!/usr/bin/env bash
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return


####################PROJECT DIRS####################
export LANL_DIR=${HOME}/lanl
export ORNL_DIR=${HOME}/ornl
export SNAPHU_DIR=${HOME}/snaphu

export WEAKLIB_DIR=${ORNL_DIR}/codes/weaklib
export THORNADO_DIR=${ORNL_DIR}/codes/thornado
export POSEIDON_DIR=${ORNL_DIR}/codes/poseidon
export PHOEBUS_DIR=${LANL_DIR}/code/phoebus
export PARTHENON_DIR=${LANL_DIR}/code/parthenon
export AMREX_DIR=${ORNL_DIR}/codes/amrex
export AMREX_HOME=${AMREX_DIR}
export THORNADO_HOME=${THORNADO_DIR}
export WEAKLIB_HOME=${WEAKLIB_DIR}
#export HDF5_DIR=/usr/local/Cellar/hdf5/1.12.0_1
#export HDF5_HOME=${HDF5_DIR}
export WEAKLIB_MACHINE=bbarker
export THORNADO_MACHINE=bbarker

export PTOOLSDIR=${HOME}/Documents/papers/paperTools

export SNEC_DIR=${SNAPHU_DIR}/codes/SNEC
export PROGS=${SNAPHU_DIR}/codes/progs
export PROGENITORS=${SNAPHU_DIR}/progenitor_models
export SNAC_DIR=${SNAPHU_DIR}/codes/snac
export SNEC_MODELS=/Volumes/erebor/snaphu/alpha1.25_snec
export HELMDIR=${SNAPHU_DIR}/codes/helmholtz
export PYTHONPATH=${SNAC_DIR}:${PYTHONPATH}
export PYTHONPATH=${PROGS}:${PYTHONPATH}
export PYTHONPATH=${PARTHENON_DIR}/scripts/python/packages/parthenon_tools/parthenon_tools/:${PYTHONPATH}
#export PYTHONPATH=${HELMDIR}:${PYTHONPATH}
##################################################

export LANL_DIR=${HOME}/lanl
export SINGULARITY_EOS_DIR=${LANL_DIR}/code/singularity-eos
export PYTHONPATH=${SINGULARITY_EOS_DIR}/build/python:${PYTHONPATH}

####################JULIA####################
#alias julia='/usr/opt/julia-1.6.1/bin/julia'
########################################

####################MESA####################
#export OMP_NUM_THREADS=8
#setup_mesa () {
#    export MESA_DIR=${HOME}/code/kavli/mesa-r15140
#    export OMP_NUM_THREADS=8
#    export MESASDK_ROOT=${HOME}/code/kavli/mesasdk
#    source "${MESASDK_ROOT}/bin/mesasdk_init.sh"
#    export MESA_CONTRIB_DIR=${HOME}/code/kavli/mesa-contrib
#}
############################################

#########
# #  ---------------------------------------------------------------------------

#   -------------------------------
#   1.  ENVIRONMENT CONFIGURATION
#   -------------------------------

export LS_COLORS="rs=0:di=38;5;109:ln=38;5;214:mh=00:pi=38;5;142:so=38;5;167:do=38;5;167:bd=38;5;142:cd=38;5;142:or=38;5;167:mi=00:su=38;5;214:sg=38;5;214:ca=38;5;167:tw=38;5;109:ow=38;5;109:st=38;5;167:ex=38;5;142:*.tar=38;5;208:*.tgz=38;5;208:*.arc=38;5;208:*.arj=38;5;208:*.taz=38;5;208:*.lha=38;5;208:*.lz4=38;5;208:*.lzh=38;5;208:*.lzma=38;5;208:*.tlz=38;5;208:*.txz=38;5;208:*.tzo=38;5;208:*.t7z=38;5;208:*.zip=38;5;208:*.z=38;5;208:*.dz=38;5;208:*.gz=38;5;208:*.lrz=38;5;208:*.lz=38;5;208:*.lzo=38;5;208:*.xz=38;5;208:*.zst=38;5;208:*.tzst=38;5;208:*.bz2=38;5;208:*.bz=38;5;208:*.tbz=38;5;208:*.tbz2=38;5;208:*.tz=38;5;208:*.deb=38;5;208:*.rpm=38;5;208:*.jar=38;5;208:*.war=38;5;208:*.ear=38;5;208:*.sar=38;5;208:*.rar=38;5;208:*.alz=38;5;208:*.ace=38;5;208:*.zoo=38;5;208:*.cpio=38;5;208:*.7z=38;5;208:*.rz=38;5;208:*.cab=38;5;208:*.wim=38;5;208:*.swm=38;5;208:*.dwm=38;5;208:*.esd=38;5;208:*.jpg=38;5;175:*.jpeg=38;5;175:*.mjpg=38;5;175:*.mjpeg=38;5;175:*.gif=38;5;175:*.bmp=38;5;175:*.pbm=38;5;175:*.pgm=38;5;175:*.ppm=38;5;175:*.tga=38;5;175:*.xbm=38;5;175:*.xpm=38;5;175:*.tif=38;5;175:*.tiff=38;5;175:*.png=38;5;175:*.svg=38;5;175:*.svgz=38;5;175:*.mng=38;5;175:*.pcx=38;5;175:*.mov=38;5;175:*.mpg=38;5;175:*.mpeg=38;5;175:*.m2v=38;5;175:*.mkv=38;5;175:*.webm=38;5;175:*.webp=38;5;175:*.ogm=38;5;175:*.mp4=38;5;175:*.m4v=38;5;175:*.mp4v=38;5;175:*.vob=38;5;175:*.qt=38;5;175:*.nuv=38;5;175:*.wmv=38;5;175:*.asf=38;5;175:*.rm=38;5;175:*.rmvb=38;5;175:*.flc=38;5;175:*.avi=38;5;175:*.fli=38;5;175:*.flv=38;5;175:*.gl=38;5;175:*.dl=38;5;175:*.xcf=38;5;175:*.xwd=38;5;175:*.yuv=38;5;175:*.cgm=38;5;175:*.emf=38;5;175:*.ogv=38;5;175:*.ogx=38;5;175:*.aac=38;5;214:*.au=38;5;214:*.flac=38;5;214:*.m4a=38;5;214:*.mid=38;5;214:*.midi=38;5;214:*.mka=38;5;214:*.mp3=38;5;214:*.mpc=38;5;214:*.ogg=38;5;214:*.ra=38;5;214:*.wav=38;5;214:*.oga=38;5;214:*.opus=38;5;214:*.spx=38;5;214:*.xspf=38;5;214:"
alias ls='ls --color=always'

export GREP_COLORS="mt=38;5;167:sl=:cx=:fn=38;5;109:ln=38;5;142:bn=38;5;142:se=38;5;245"
alias grep='grep --color=auto'

# Function to get git branch [DEPRECATED]
#parse_git_branch() {
#    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
#}

# Function to get Python virtual environment
get_virtual_env() {
    if [[ -n "$VIRTUAL_ENV" ]]; then
        # Get the parent directory of .venv
        venv_parent=$(basename "$(dirname "$VIRTUAL_ENV")")
        echo "($venv_parent) "
    fi
}

# Colors
#CYAN="\[\033[36m\]"
#BLUE="\[\033[34m\]"
#GREEN="\[\033[32m\]"
#RESET="\[\033[0m\]"

# Gruvbox Colors
AQUA="\[\033[38;2;104;157;106m\]"    # #689d6a
BLUE="\[\033[38;2;69;133;136m\]"     # #458588
YELLOW="\[\033[38;2;215;153;33m\]"   # #d79921
GREEN="\[\033[38;2;152;151;26m\]"    # #98971a
#ORANGE="\[\033[38;2;175;58;3m\]"
PURPLE="\[\033[38;2;143;63;113m\]"
#BEIGE="\[\033[38;2;249;245;215\]"
RESET="\[\033[0m\]"

# Set colored prompt with Gruvbox theme
#PROMPT_COMMAND='PS1="${AQUA}\$(get_virtual_env)${PURPLE}[${BLUE}\u@\h:${YELLOW}\W${PURPLE}]${GREEN}\$(parse_git_branch)${RESET} $ "'
PROMPT_COMMAND='PS1="${BLUE}\$(get_virtual_env)${PURPLE}[${AQUA}\u@\h:${YELLOW}\W${PURPLE}]${GREEN}$(__git_ps1 " (%s)")${RESET} $ "'

# shellcheck source=/home/barker/.git-prompt.sh
source "${HOME}/.git-prompt.sh"

export PS1=$PROMPT_COMMAND

# --- Smart history ---
# \e[A is up arrow, \C-e moves to end of line
# # Basic history search
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

# Auto-jump to end of line after any editing command
bind 'set enable-bracketed-paste on'
bind 'set show-all-if-ambiguous on'
#bind 'set skip-completed-text on'

# Improved history handling
HISTSIZE=10000
HISTFILESIZE=20000
HISTCONTROL=ignoreboth:erasedups

# Don't put duplicate lines or lines starting with space in the history
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it
shopt -s histappend

# Update history after each command
#PROMPT_COMMAND="history -a; history -n; $PROMPT_COMMAND"

# Store multiline commands as one command
shopt -s cmdhist

# Expand ! history substitutions
shopt -s histverify

#   Set Paths
#   ------------------------------------------------------------
export PATH="/usr/local/bin/:$PATH"

#   Set Default Editor (change 'Nano' to the editor of your choice)
#   ------------------------------------------------------------
export EDITOR=/usr/bin/nvim

#   Set default blocksize for ls, df, du
#   from this: http://hints.macworld.com/comment.php?mode=view&cid=24491
#   ------------------------------------------------------------
# export BLOCKSIZE=1k

#   -----------------------------
#   2.  MAKE TERMINAL BETTER
#   -----------------------------

alias vi='nvim'
alias vim='nvim'
alias weather='curl wttr.in'
alias cp='cp -v'                           # Preferred 'cp' implementation
alias mv='mv -v'                           # Preferred 'mv' implementation
alias mkdir='mkdir -pv'                     # Preferred 'mkdir' implementation
alias ll='ls -FGlAhp'                       # Preferred 'ls' implementation
alias less='less -FSRXc'                    # Preferred 'less' implementation
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias c='clear'                             # c:            Clear terminal display
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias cpwd='pwd | pbcopy'
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias jlab='jupyter lab'

# --- Clusters ---
alias acf='ssh -XY barker5@duo.acf.utk.edu'
alias galilinux='ssh brandon@galilinux.pi.infn.it'
alias rm='rm -i'
alias hpcc='ssh -XY barker49@hpcc.msu.edu'

# Project aliases
alias thornado='cd $THORNADO_DIR'
alias snec='cd $SNEC_DIR'
alias snaphu='cd $SNAPHU_DIR'
alias phoebus='cd $PHOEBUS_DIR'

#   -------------------------------
#   3.  FILE AND FOLDER MANAGEMENT
#   -------------------------------

zipf () { zip -r "$1".zip "$1" ; }          # zipf:         To create a ZIP archive of a folder
alias numFiles='echo $(ls -1 | wc -l)'      # numFiles:     Count of non-hidden files in current dir
tarc () { tar -cvzf "$1".tar.gz "$1" ; }          # zipf:         To create a tar.gz

#   extract:  Extract most know archives with one command
#   ---------------------------------------------------------
extract () {
    if [ -f "$1" ] ; then
        case "$1" in
        *.tar.bz2)   tar xjf "$1"     ;;
        *.tar.gz)    tar xzf "$1"     ;;
        *.bz2)       bunzip2 "$1"     ;;
        *.rar)       unrar e "$1"     ;;
        *.gz)        gunzip "$1"      ;;
        *.tar)       tar xf "$1"      ;;
        *.tbz)      tar xjf "$1"     ;;
        *.tbz2)      tar xjf "$1"     ;;
        *.tgz)       tar xzf "$1"     ;;
        *.zip)       unzip "$1"       ;;
        *.Z)         uncompress "$1"  ;;
        *.7z)        7z x "$1"        ;;
        *)     echo "'$1' cannot be extracted via extract()" ;;
            esac
        else
            echo "'$1' is not a valid file"
        fi
}


# Runs programs in the background, even after shell closes
# bkr ./script.sh is now running in the background
bkr() {
  (nohup "$@" &>/dev/null &)
}

cloc-git() {
  git clone --depth 1 "$1" temp-linecount-repo &&
    printf "('temp-linecount-repo' will be deleted automatically)\n\n\n" &&
    cloc temp-linecount-repo &&
    rm -rf temp-linecount-repo
}
cloc-git-recursive() {
  git clone --recursive "$1" temp-linecount-repo &&
    printf "('temp-linecount-repo' will be deleted automatically)\n\n\n" &&
    cloc temp-linecount-repo &&
    rm -rf temp-linecount-repo
}

# STARTUP ---------- SSH KEY business
SSH_ENV="$HOME/.ssh/environment"

function start_agent {
    echo "Initialising new SSH agent..."
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    # shellcheck source=/home/barker/.ssh/environment
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    # shellcheck source=/home/barker/.ssh/environment
    . "${SSH_ENV}" > /dev/null
    pgrep -f ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi
