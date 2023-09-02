#===================================#   
# Syntax highlighting configuration #
#===================================#

# Declare the variable
typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern regexp root line)

ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=121'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=121'
ZSH_HIGHLIGHT_STYLES[comment]='fg=245'

ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=203'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=229'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=119'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=202'
ZSH_HIGHLIGHT_STYLES[function]='fg=123'

ZSH_HIGHLIGHT_STYLES[path]='fg=231,underline'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=123,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=231,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=123,underline'

ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=229'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=217'

ZSH_HIGHLIGHT_STYLES[globbing]='fg=229'
ZSH_HIGHLIGHT_STYLES[assign]='fg=123'

# commands like echo git npm
ZSH_HIGHLIGHT_STYLES[builtin]='fg=119'
ZSH_HIGHLIGHT_STYLES[alias]='fg=218'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=218'
ZSH_HIGHLIGHT_STYLES[command]='fg=119'

ZSH_HIGHLIGHT_STYLES[default]='fg=255'

# To define styles for nested brackets up to level 4
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=221'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=221'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=221'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=221'
ZSH_HIGHLIGHT_STYLES[bracket-level-5]='fg=221'
ZSH_HIGHLIGHT_STYLES[bracket-level-6]='fg=221'
ZSH_HIGHLIGHT_STYLES[bracket-level-7]='fg=221'
ZSH_HIGHLIGHT_STYLES[bracket-error]='fg=202'


ZSH_HIGHLIGHT_STYLES[line]='bold'

# Declare the variable
typeset -A ZSH_HIGHLIGHT_PATTERNS

# Regex patterns
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf' 'bold,bg=red')