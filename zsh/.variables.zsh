#=======================#
# Environment Variables #
#=======================#

export PATH="/usr/local/sbin:$PATH"
export GEM_HOME="$HOME/.config/ruby/gems"
export NODE_REPL_HISTORY="$HOME/.config/node/.node_repl_history"

# Grep Colors
export GREP_COLORS='ms=01;33:mc=01;31:sl=:cx=:fn=35:ln=32:bn=32:se=36'

[ -f ~/.config/.fzf.zsh ] && source ~/.config/.fzf.zsh

export EDITOR='vim'

# Pyenv
eval "$(pyenv init --path)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

 # NVM
 export NVM_DIR="$HOME/.nvm"
 [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
 [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/adamjonas/.sdkman"
[[ -s "/Users/adamjonas/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/adamjonas/.sdkman/bin/sdkman-init.sh"