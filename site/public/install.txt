#!/bin/fish
set dotfiles $HOME/.dotfiles
set backup $HOME/.dotfiles-backup
set confd $HOME/.config/fish/conf.d/dm.fish
# initialize bare repository
echo "Creating .dotfiles"
git init --bare $dotfiles
echo Created .dotfiles at $dotfiles
# or if already have dotfiles
# git clone --bare https://github.com/idkjs/dotfiles.git "$HOME/.dotfiles"

# add dm function to our conf.d so fish is aware of it and we can use it below

fisher install idkjs/dm >/dev/null
and echo Added "idkjs/dm to $confd"
or echo "Could not add dm.fish from github, adding manually"
echo "alias dm='git --git-dir=\$HOME/.dotfiles/ --work-tree=\$HOME'" >$confd

echo "Creating .dotfiles-backup"

mkdir -p $backup && \
git --git-dir=$HOME/.dotfiles --work-tree=$HOME checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} $backup/{}
dm checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
    xargs -I{} mv {} $backup/{}

echo Created .dotfiles-backup at $backup

# run dm to configure git to not show untracked files

dm config status.showUntrackedFiles no
