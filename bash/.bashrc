#!/usr/bin/env bash
# ~/.bashrc

[[ -n "${BASH_VERSION:-}" ]] || return
[[ $- != *i* ]] && return

# Check if file exists and run it.
bash_source() {
  # shellcheck source=/dev/null
  [[ -r "$1" ]] && source "$1"
}

BASH_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}/bash"

bash_source "$BASH_CONFIG_HOME/history"
bash_source "$BASH_CONFIG_HOME/prompt"
bash_source "$BASH_CONFIG_HOME/functions"
bash_source "$BASH_CONFIG_HOME/ssh"
bash_source "$BASH_CONFIG_HOME/aliases"
bash_source "$BASH_CONFIG_HOME/completions"
bash_source "$BASH_CONFIG_HOME/projects"
bash_source "$BASH_CONFIG_HOME/toolchains"
bash_source "$BASH_CONFIG_HOME/local"
