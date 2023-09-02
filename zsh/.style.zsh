#===================================#   
# Syntax highlighting configuration #
#===================================#

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