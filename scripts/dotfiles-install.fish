#!/bin/fish
set dotfiles $HOME/.dotfiles
set dotfiles_backup $HOME/.dotfiles-backup
set confd $HOME/.config/fish/conf.d/dotfiles.fish
# initialize bare repository
git init --bare $dotfiles
# add .dotfiles to source repository .gitignore where you'll clone it, so that you don't create weird recursion problems:
echo ".dotfiles" >> $dotfiles/.gitignore
# or if already have dotfiles
# git clone --bare https://github.com/idkjs/dotfiles.git "$HOME/.dotfiles"
# function dotfiles --wraps '/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME' --description 'alias dotfiles=/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
#     /usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv
# end
alias dm='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

echo "Creating .dotfiles-backup"

mkdir -p $dotfiles_backup && \
    dm checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
    xargs -I{} mv {} $dotfiles_backup/{}

echo Created .dotfiles-backup at $dotfiles_backup
# dotfiles checkout >/dev/null
# and echo Checked out dotfiles
# or echo "Backing up pre-existing dot files."
# dotfiles checkout 2>&1 | grep -E "\s+\." | awk {'print $1'} | xargs -I{} mv {} .dotfiles-backup/{}

# run our dotfiles alias to configure git to not show untracked files

dm config status.showUntrackedFiles no

# add dotfiles function to our conf.d so fish is always aware of it

# manually
rm $confd
echo "alias dm='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
">> $confd

# with fisher
# fisher install idkjs/dotfiles.fish
