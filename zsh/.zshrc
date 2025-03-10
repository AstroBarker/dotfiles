# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

ZSH_DISABLE_COMPFIX=true

export PACMAN=pacman

####################THORNADO####################
export WEAKLIB_DIR=${HOME}/ornl/codes/weaklib
export THORNADO_DIR=${HOME}/ornl/codes/thornado
export POSEIDON_DIR=${HOME}/ornl/codes/poseidon
export AMREX_DIR=${HOME}/ornl/codes/amrex
export AMREX_HOME=${AMREX_DIR}
export THORNADO_HOME=${THORNADO_DIR}
export WEAKLIB_HOME=${WEAKLIB_DIR}
export HDF5_DIR=/usr/local/Cellar/hdf5/1.12.0_1
export HDF5_HOME=${HDF5_DIR}
export WEAKLIB_MACHINE=bbarker
export THORNADO_MACHINE=bbarker
################################################

export PTOOLSDIR=${HOME}/Documents/papers/paperTools

####################SNAPHU####################
export SNAPHU_DIR=${HOME}/snaphu
export SNEC_DIR=${SNAPHU_DIR}/codes/SNEC
export PROGS=${SNAPHU_DIR}/codes/progs
export PROGENITORS=${SNAPHU_DIR}/progenitor_models
export SNAC_DIR=${SNAPHU_DIR}/codes/snac
export SNEC_MODELS=/Volumes/erebor/snaphu/alpha1.25_snec
export HELMDIR=${SNAPHU_DIR}/codes/helmholtz
export PYTHONPATH=${SNAC_DIR}:${PYTHONPATH}
export PYTHONPATH=${PROGS}:${PYTHONPATH}
#export PYTHONPATH=${HELMDIR}:${PYTHONPATH}
################################################

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
    source "${MESASDK_ROOT}/bin/mesasdk_init.sh"
    export MESA_CONTRIB_DIR=${HOME}/code/kavli/mesa-contrib
}
setup_mesa_snaphu () {
    export MESA_DIR=${HOME}/snaphu/code/mesa-r24.03.1
    export OMP_NUM_THREADS=4
    export MESASDK_ROOT=${HOME}/snaphu/code/mesasdk
    source "${MESASDK_ROOT}/bin/mesasdk_init.sh"
    export MESA_CONTRIB_DIR=${HOME}/code/kavli/mesa-contrib
}
############################################


# Path to your oh-my-zsh installation.
export ZSH="/home/barker/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="kphoen"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git )

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

#########
# #  ---------------------------------------------------------------------------

#   -------------------------------
#   1.  ENVIRONMENT CONFIGURATION
#   -------------------------------


#   Set Paths
#   ------------------------------------------------------------
export PATH="/usr/local/bin/:$PATH"
export PATH="${HOME}/.local/bin/:$PATH"

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
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias f='open -a Finder ./'                 # f:            Opens current directory in MacOS Finder
alias ~="cd ~"                              # ~:            Go Home
alias c='clear'                             # c:            Clear terminal display
alias path='echo -e ${PATH//:/\\n}'         # path:         Echo all executable Paths
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias cpwd='pwd | pbcopy'
alias show_options='shopt'                  # Show_options: display bash options settings
alias fix_stty='stty sane'                  # fix_stty:     Restore terminal settings when screwed up
alias cic='set completion-ignore-case On'   # cic:          Make tab-completion case-insensitive

# --- Clusters ---
alias acf='ssh -XY barker5@duo.acf.utk.edu'
alias galilinux='ssh brandon@galilinux.pi.infn.it'
alias rm='rm -i'
alias hpcc='ssh -tXY barker49@hpcc.msu.edu'
alias jlab='jupyter lab'

# Project aliases
alias thornado='cd $THORNADO_DIR'
alias snec='cd $SNEC_DIR'
alias snaphu='cd $SNAPHU_DIR'

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

# list installed packages, interactively. requires fzf
packages () {
    pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'
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

source "${HOME}/.cargo/env"

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

path=('/home/barker/.juliaup/bin' $path)
export PATH

# <<< juliaup initialize <<<

[ -f "/home/barker/.ghcup/env" ] && . "/home/barker/.ghcup/env" # ghcup-env

# asdf
. /opt/asdf-vm/asdf.sh
