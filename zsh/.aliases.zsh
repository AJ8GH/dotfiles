#==========#
# Aliases #
#==========#

alias idea=idea1
alias vim=nvim
alias pc='printColors'
alias c='clear'

# ls with colour
alias ll='exa -al -h --time-style=long-iso'
alias lm='exa -alt modified --time-style=long-iso'
alias lc='exa -alt created --time-style=long-iso'
alias lch='exa -alt changed --time-style=long-iso'
alias lta='exa -alt accessed --time-style=long-iso'
alias la='exa -la --time-style=long-iso'

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

# Editor Config
alias ec='cp ~/.config/.editorconfig .'

# Git
alias gpl='git pull'
