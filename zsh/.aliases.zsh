#==========#
# Aliases #
#==========#

alias idea=idea1
alias pc='printColors'
alias c='clear'

# vim
alias v='vim .'
alias vim='nvim'
alias vv='cd $XDG_CONFIG_HOME/nvim && vim .'

# ls with colour
alias ll='eza -al -h --time-style=long-iso'
alias lm='eza -alt modified --time-style=long-iso'
alias lc='eza -alt created --time-style=long-iso'
alias lch='eza -alt changed --time-style=long-iso'
alias lta='eza -alt accessed --time-style=long-iso'
alias la='eza -la --time-style=long-iso'

alias mv='mv -i'

alias aoc-jar='kotlin lib/build/libs/lib.jar'
alias aoc2='kotlin /Users/adamjonas/.config/.aoc/jars/current.jar'
alias aoc='aoc2'

# cat & less with colour
# alias cat='ccat' - this breaks sdkman
alias less='cless'

# Pretty print the path
# alias path='echo $PATH | tr -s ":" "\n"'
alias path='echo -e ${PATH//:/\\n}'

# Network
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'
alias localip='ipconfig getifaddr en0'

# Brew dependencies
alias brewdeps='brew leaves | xargs brew deps --include-build --tree'

# ZSH
alias vzrc='vim ~/.config/zsh/.zshrc'
alias vz='vim ~/.config/zsh/zsh-config'
alias fz='fleet ~/.config/zsh/zsh-config'
alias cz='code ~/.config/zsh/zsh-config'
alias ff='fzf'

# Editor Config
alias ec='cp ~/.config/.editorconfig .'

# Git
alias gpl='git pull'
