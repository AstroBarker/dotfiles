#
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
export PHOEBUS_DIR=${LANL_DIR}/codes/phoebus
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
#export PYTHONPATH=${HELMDIR}:${PYTHONPATH}
##################################################

export LANL_DIR=${HOME}/lanl
export SINGULARITY_EOS_DIR=${LANL_DIR}/code/singularity-eos
export PYTHONPATH=${SINGULARITY_EOS_DIR}/build/python:${PYTHONPATH}

####################JULIA####################
#alias julia='/usr/opt/julia-1.6.1/bin/julia'
########################################

####################MESA####################
# set OMP_NUM_THREADS to be the number of cores on your machine
export OMP_NUM_THREADS=8
setup_mesa () {
    export MESA_DIR=${HOME}/code/kavli/mesa-r15140
    export OMP_NUM_THREADS=8
    export MESASDK_ROOT=${HOME}/code/kavli/mesasdk
    source ${MESASDK_ROOT}/bin/mesasdk_init.sh
    export MESA_CONTRIB_DIR=${HOME}/code/kavli/mesa-contrib
}
############################################

#########
# #  ---------------------------------------------------------------------------

#   -------------------------------
#   1.  ENVIRONMENT CONFIGURATION
#   -------------------------------

# case insensitive autocomplete
bind 'set completion-ignore-case on'

alias ls='ls --color=auto'
bind 'set colored-stats on' # colors in tab autocomplete

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

# Uncomment the line below for colored prompt
#PROMPT_COMMAND='PS1="${CYAN}\$(get_virtual_env)${BLUE}[\u@\h:${GREEN}\W${BLUE}]${CYAN}\$(parse_git_branch)${RESET} $ "'

# Gruvbox Colors
AQUA="\[\033[38;2;104;157;106m\]"    # #689d6a
BLUE="\[\033[38;2;69;133;136m\]"     # #458588
YELLOW="\[\033[38;2;215;153;33m\]"   # #d79921
GREEN="\[\033[38;2;152;151;26m\]"    # #98971a
ORANGE="\[\033[38;2;175;58;3m\]"
PURPLE="\[\033[38;2;143;63;113m\]"
BEIGE="\[\033[38;2;249;245;215\]"
RESET="\[\033[0m\]"

# Set colored prompt with Gruvbox theme
#PROMPT_COMMAND='PS1="${AQUA}\$(get_virtual_env)${PURPLE}[${BLUE}\u@\h:${YELLOW}\W${PURPLE}]${GREEN}\$(parse_git_branch)${RESET} $ "'
PROMPT_COMMAND='PS1="${BLUE}\$(get_virtual_env)${PURPLE}[${AQUA}\u@\h:${YELLOW}\W${PURPLE}]${GREEN}$(__git_ps1 " (%s)")${RESET} $ "'

source ~/.git-prompt.sh

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
    if [ -f $1 ] ; then
        case $1 in
        *.tar.bz2)   tar xjf $1     ;;
        *.tar.gz)    tar xzf $1     ;;
        *.bz2)       bunzip2 $1     ;;
        *.rar)       unrar e $1     ;;
        *.gz)        gunzip $1      ;;
        *.tar)       tar xf $1      ;;
        *.tbz)      tar xjf $1     ;;
        *.tbz2)      tar xjf $1     ;;
        *.tgz)       tar xzf $1     ;;
        *.zip)       unzip $1       ;;
        *.Z)         uncompress $1  ;;
        *.7z)        7z x $1        ;;
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
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin
    ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

export PATH="/usr/local/sbin:$PATH"
