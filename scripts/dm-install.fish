#!/bin/fish
set dotfiles $HOME/.dotfiles
set dotfiles_backup $HOME/.dotfiles-backup
set confd $HOME/.config/fish/conf.d/dm.fish
# initialize bare repository
git init --bare $dotfiles

# or if already have dotfiles
# git clone --bare https://github.com/idkjs/dotfiles.git "$HOME/.dotfiles"

# add .dotfiles to source repository .gitignore where you'll clone it, so that you don't create weird recursion problems:
echo ".dotfiles" >> $dotfiles/.gitignore

# add dm function to our conf.d so fish is aware of it and we can use it below

fisher install idkjs/dm.fish >/dev/null
and echo Added "idkjs/dm.fish to $confd"
or echo "Could not add idkjs/dm.fish from github, adding manually"
echo "alias dm='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME" >> $confd

# local
# alias dm='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

echo "Creating .dotfiles-backup"

mkdir -p $dotfiles_backup && \
    dm checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
    xargs -I{} mv {} $dotfiles_backup/{}

echo Created .dotfiles-backup at $dotfiles_backup

# run our dotfiles alias to configure git to not show untracked files

dm config status.showUntrackedFiles no

# add dotfiles function to our conf.d so fish is always aware of it

# manually
# rm $confd
# echo "alias dm='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
# ">> $confd

# with fisher
# fisher install idkjs/dotfiles.fish