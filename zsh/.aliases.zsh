#==========#
# Aliasses #
#==========#

alias pc='printColors'
alias c='clear'

# ls with colour
alias ll='exa -al -h'
alias lm='exa -alt modified'
alias lc='exa -alt created'
alias lch='exa -alt changed'
alias lta='exa -alt accessed'
alias la='exa -la'

alias mv='mv -i'

alias aoc-jar='kotlin lib/build/libs/lib.jar'

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
