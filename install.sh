#!/bin/bash

#=============
# Install packages
#=============
echo -e "\n========== Installing Dotfiles ==========\n"

mkdir -p .config/zsh/zsh-config
mkdir -p .config/git
mkdir -p .config/iterm2

#=============
# Vim, Homebrew, Shell
#=============
# Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew doctor
brew update
brew_packages="kcat htop gotop httpie curl exa k6 ripgrep tmux pygments jq cowsay kafka bitwarden-cli"
brew install ${brew_packages}

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone --depth 1 https://github.com/unixorn/fzf-zsh-plugin.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/fzf-zsh-plugin
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Ultimate vimrc
git clone --depth=1 https://github.com/amix/vimrc.git ~/.vim_runtime
sh ~/.vim_runtime/install_awesome_vimrc.sh

#=============
# Languages & version managers
#=============
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
brew install pyenv
curl -s "https://get.sdkman.io" | bash
brew install rvm

#=============
# Move old dot files
#=============
mv .zshrc .zshrc-old
mv .gitconfig .gitconfig-old
mv .p10k .p10k-old
mv .fzf.bash ~/.config/
mv .fzf.zsh ~/.config/
mv .zcompdump* /Users/adamjonas/.config/zsh/
mv .zlogin /Users/adamjonas/.config/zsh/
mv .zsh_history* /Users/adamjonas/.config/zsh/
mv .zsh_profile /Users/adamjonas/.config/zsh/
mv .zshrc-old /Users/adamjonas/.config/zsh/
mv .zsh_sessions /Users/adamjonas/.config/zsh/
mv pre-oh-my-zsh /Users/adamjonas/.config/zsh/
mv .zcompcache /Users/adamjonas/.config/zsh/
mv .lesshst /Users/adamjonas/.config/

#=============
# Create symlinks
#=============
ln -s /Users/adamjonas/projects/dotfiles/zsh/.zshrc /Users/adamjonas/.config/zsh/zsh-config/
ln -s /Users/adamjonas/projects/dotfiles/zsh/.functions.zsh /Users/adamjonas/.config/zsh/zsh-config/
ln -s /Users/adamjonas/projects/dotfiles/zsh/.aliases.zsh /Users/adamjonas/.config/zsh/zsh-config/
ln -s /Users/adamjonas/projects/dotfiles/zsh/.variables.zsh /Users/adamjonas/.config/zsh/zsh-config/
ln -s /Users/adamjonas/projects/dotfiles/zsh/.style.zsh /Users/adamjonas/.config/zsh/zsh-config/
ln -s /Users/adamjonas/projects/dotfiles/zsh/.zshenv /Users/adamjonas/.config/zsh/zsh-config/
ln -s /Users/adamjonas/projects/dotfiles/zsh/.zshenv /Users/adamjonas/
ln -s /Users/adamjonas/projects/dotfiles/p10k/.p10k_config.zsh /Users/adamjonas/.config/zsh/zsh-config/
ln -s /Users/adamjonas/projects/dotfiles/git/.gitconfig /Users/adamjonas/.config/git/
ln -s /Users/adamjonas/projects/dotfiles/.editorconfig /Users/adamjonas/.config/git/
ln -s /Users/adamjonas/Projects/dotfiles/vim/my_configs.vim /Users/adamjonas/.vim/vim_runtime/

#=============
# Finished
#=============
echo -e "\n========== Install Complete! ==========\n"
