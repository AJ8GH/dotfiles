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

alias trash='mv -f ~/.Trash'
alias mv='mv -i'

# cat & less with colour
alias cat='ccat'
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
alias vz='vim ~/.config/zsh/.zshrc'
alias fz='fleet ~/.config/zsh/zsh-config'
alias cz='code ~/.config/zsh/zsh-config'

# Editor Config
alias ec='cp ~/.config/.editorconfig .'