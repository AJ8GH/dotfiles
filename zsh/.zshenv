# ---- Default editors ---- #
export EDITOR="nvim"
export VISUAL="nvim"

# ---- XDG BASE DIRECTORY ---- #
# https://wiki.archlinux.org/title/XDG_Base_Directory
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_STATE_HOME=${XDG_STATE_HOME:="$HOME/.local/state"}

# ---- ZSH ---- #
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
# export HISTFILE="$XDG_STATE_HOME/zsh"
export SHELL_SESSION_DIR="$XDG_STATE_HOME/zsh/sessions"
export SHELL_SESSION_FILE="$SHELL_SESSION_DIR/$TERM_SESSION_ID"

export LESSHISTFILE="$XDG_CONFIG_HOME"
export NETRC="$XDG_CONFIG/.netrc"
# export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

. "$HOME/.cargo/env"
