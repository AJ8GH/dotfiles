#!/bin/sh

mv ~/.config/nvim{,.bak-tmp}
mv ~/.local/share/nvim{,.bak-tmp}
mv ~/.local/state/nvim{,.bak-tmp}
mv ~/.cache/nvim{,.bak-tmp}

mv ~/.config/nvim.bak ~/.config/nvim
mv ~/.local/share/nvim.bak ~/.local/share/nvim
mv ~/.local/state/nvim.bak ~/.local/state/nvim
mv ~/.cache/nvim.bak ~/.cache/nvim

mv ~/.config/nvim.bak-tmp ~/.config/nvim.bak
mv ~/.local/share/nvim.bak-tmp ~/.local/share/nvim.bak
mv ~/.local/state/nvim.bak-tmp ~/.local/state/nvim.bak
mv ~/.cache/nvim.bak-tmp ~/.cache/nvim.bak
