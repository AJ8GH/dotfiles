#!/bin/bash

#=============
# Install packages
#=============

#=============
# Vim, Homebrew, Shell
#=============
# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew doctor
brew update

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Powerlevel 10K
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Ultimate vimrc
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

#fzf
$(brew --prefix)/opt/fzf/install

#=============
# Languages & version managers
#=============
# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash

# Node
nvm install node
nvm install --lts
nvm install 14.18.1

# pyenv
brew install pyenv

# Python
pyenv install 3.10.0
pyenv install 2.7.18

# SDKMAN
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Java
sdk install java 11.0.11.hs-adpt
sdk install java 8.0.292.hs-adpt

# rbenv
brew install rbenv

# Ruby
rbenv install -l
rbenv install 2.7.4

#=============
# Other
#=============
brew_packages="kcat htop gotop httpie curl exa k6 ripgrep tmux pygments"
brew install ${brew_packages}

#=============
# Zsh plugins
#=============
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

#=============
# Remove old dot files
#=============
rm -f .zshrc
rm -f .gitconfig
rm -f .p10k

#=============
# Create symlinks
#=============
ln -s dotfiles/zsh/.zshrc ~/
ln -s dotfiles/p10k/.p10k ~/
ln -s dotfiles/git/.gitconfig ~/

#=============
# Finished
#=============
echo -e "\n========== Install Complete! ==========\n"
