#===================================#
# Syntax highlighting configuration #
#===================================#

# Declare the variable
typeset -A ZSH_HIGHLIGHT_STYLES

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern regexp root line)

ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=011'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=011'
ZSH_HIGHLIGHT_STYLES[comment]='fg=008'

ZSH_HIGHLIGHT_STYLES[commandseparator]='fg=012'
ZSH_HIGHLIGHT_STYLES[redirection]='fg=004'

ZSH_HIGHLIGHT_STYLES[path]='fg=007,underline'
ZSH_HIGHLIGHT_STYLES[path_pathseparator]='fg=004,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix]='fg=007,underline'
ZSH_HIGHLIGHT_STYLES[path_prefix_pathseparator]='fg=004,underline'

ZSH_HIGHLIGHT_STYLES[single-hyphen-option]='fg=015'
ZSH_HIGHLIGHT_STYLES[double-hyphen-option]='fg=003'

ZSH_HIGHLIGHT_STYLES[globbing]='fg=012'
ZSH_HIGHLIGHT_STYLES[assign]='fg=007'

# commands like echo git npm
ZSH_HIGHLIGHT_STYLES[builtin]='fg=002'
ZSH_HIGHLIGHT_STYLES[alias]='fg=002'
ZSH_HIGHLIGHT_STYLES[global-alias]='fg=002'
ZSH_HIGHLIGHT_STYLES[command]='fg=002'
ZSH_HIGHLIGHT_STYLES[reserved-word]='fg=002'
ZSH_HIGHLIGHT_STYLES[function]='fg=002'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=001'

ZSH_HIGHLIGHT_STYLES[default]='fg=015'

# To define styles for nested brackets up to level 4
ZSH_HIGHLIGHT_STYLES[bracket-level-1]='fg=004'
ZSH_HIGHLIGHT_STYLES[bracket-level-2]='fg=011'
ZSH_HIGHLIGHT_STYLES[bracket-level-3]='fg=005'
ZSH_HIGHLIGHT_STYLES[bracket-level-4]='fg=004'
ZSH_HIGHLIGHT_STYLES[bracket-level-5]='fg=011'
ZSH_HIGHLIGHT_STYLES[bracket-level-6]='fg=005'
ZSH_HIGHLIGHT_STYLES[bracket-level-7]='fg=004'
ZSH_HIGHLIGHT_STYLES[bracket-error]='fg=001'


ZSH_HIGHLIGHT_STYLES[line]='bold'

# Declare the variable
typeset -A ZSH_HIGHLIGHT_PATTERNS

# Regex patterns
ZSH_HIGHLIGHT_PATTERNS+=('rm -rf' 'bold,bg=red')

# Root
ZSH_HIGHLIGHT_STYLES[root]='bold,bg=red'
