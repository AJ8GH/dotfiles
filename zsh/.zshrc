# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

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
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-syntax-highlighting
    zsh-autosuggestions
    zsh-completions
    colorize
    colored-man-pages
)

# Colorize config
ZSH_COLORIZE_STYLE="monokai"

#====================
# Syntax highlighting configuration
#====================

# Declare the variable
typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern regexp root line)

ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=040'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=010'
ZSH_HIGHLIGHT_STYLES[comment]='fg=245'

ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=203'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=203'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=042'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=197'
ZSH_HIGHLIGHT_STYLES[function]='fg=075'

ZSH_HIGHLIGHT_STYLES[path]='fg=229'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=050'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=228'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=111'

ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=045'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=012'

ZSH_HIGHLIGHT_STYLES[globbing]='fg=049'
ZSH_HIGHLIGHT_STYLES[assign]='fg=228'

# commands like echo git npm
ZSH_HIGHLIGHT_STYLES[builtin]='fg=123'
ZSH_HIGHLIGHT_STYLES[alias]='fg=218'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=087'
ZSH_HIGHLIGHT_STYLES[command]='fg=119'

ZSH_HIGHLIGHT_STYLES[default]='fg=255'

# To define styles for nested brackets up to level 4
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=003'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=003'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=003'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=003'
ZSH_HIGHLIGHT_STYLES[bracket-level-5]='fg=003'
ZSH_HIGHLIGHT_STYLES[bracket-level-6]='fg=003'
ZSH_HIGHLIGHT_STYLES[bracket-level-7]='fg=003'
ZSH_HIGHLIGHT_STYLES[bracket-error]='fg=001'


ZSH_HIGHLIGHT_STYLES[line]='bold'

# Declare the variable
typeset -A ZSH_HIGHLIGHT_PATTERNS

# Regex patterns
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf' 'bold,bg=red')
ZSH_HIGHLIGHT_PATTERNS+=('*.betfair' 'bold,fg=226')
ZSH_HIGHLIGHT_PATTERNS+=('*nxt' 'bold,fg=051')
ZSH_HIGHLIGHT_PATTERNS+=('*qa' 'bold,fg=219')
ZSH_HIGHLIGHT_PATTERNS+=('*drk' 'bold,fg=084')
ZSH_HIGHLIGHT_PATTERNS+=('*prd' 'bold,fg=202')
ZSH_HIGHLIGHT_PATTERNS+=('*ie1' 'bold,fg=214')
ZSH_HIGHLIGHT_PATTERNS+=('*ie2' 'bold,fg=111')
ZSH_HIGHLIGHT_PATTERNS+=('*i2scb-ssh.app' 'bold,fg=203')

source $ZSH/oh-my-zsh.sh

autoload -U compinit && compinit

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

#====================
# Functions
#====================

printColors() {
    for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+$'\n'}; done
}

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

#====================
# Aliasses
#====================

alias pc="printColors"
alias c="clear"

# ls with colour
alias ll="exa -al -h"
alias lm="exa -alt modified"
alias lc="exa -alt created"
alias lch="exa -alt changed"
alias lta="exa -alt accessed"
alias la="exa -la"

# cat & less with colour
alias cat="ccat"
alias less="cless"

# Pretty print the path
alias path='echo $PATH | tr -s ":" "\n"'
alias path='echo -e ${PATH//:/\\n}'

# Network
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"

# Brew dependencies
alias brewdeps="brew leaves | xargs brew deps --include-build --tree"

#====================
# Environment Variables
#====================

export ZSH_COMPDUMP=$ZSH/cache/.zcompdump-$HOST

# Grep Colors
export GREP_COLORS='ms=01;33:mc=01;31:sl=:cx=:fn=35:ln=32:bn=32:se=36'

# Pyenv
eval "$(pyenv init --path)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

 # NVM
 export NVM_DIR="$HOME/.nvm"
 [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
 [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/adamjonas/.sdkman"
[[ -s "/Users/adamjonas/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/adamjonas/.sdkman/bin/sdkman-init.sh"
