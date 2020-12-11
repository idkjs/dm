

# dm

> 100% pure-<a href="https://fishshell.com" title="Portable Minimal Dotfiles ">fish</a> portable minimal dotfiles manager.

- fish implementation of [The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles) imagined by [StreakyCobra](https://news.ycombinator.com/item?id=11071754).
-
## Usage

```bash
~> dm status
#  add a global .gitignore file by adding it to your root and then pointing to it in `git config`
~> echo "node_modules" >> .gitignore
~> git config --global core.excludesFile "~/.gitignore"
//  add it to your dotfiles with `dm add .gitignore`
~> dm add .gitignore
// commit it with a message
~> dm commit -m "Add global gitignore"
// add your fish configuration
~> dm add .config/fish
~> dm commit -m "Add fish config"
// or add your whole .config directory
~> dm add .config
~> dm commit -m "Adds .config to dotfiles"
```
```bash
# use dm status to see where you are
~> dm status

On branch main

No commits yet

Changes to be committed:
  (use "git rm --cached <file>..." to unstage)
	new file:   .config/.DS_Store
	new file:   .config/configstore/update-notifier-qnm.json
	new file:   .config/configstore/update-notifier-vercel.json
	new file:   .config/fish/.DS_Store
	new file:   .config/fish/completions/fisher.fish
	new file:   .config/fish/completions/gitio.fish
	new file:   .config/fish/completions/tabtab.fish
	new file:   .config/fish/conf.d/dm.fish
	new file:   .config/fish/fish_plugins
	new file:   .config/fish/fish_variables
	new file:   .config/fish/functions/.DS_Store
	new file:   .config/fish/functions/fisher.fish
	new file:   .config/fish/functions/gitio.fish
	new file:   .config/gh/config.yml
	new file:   .config/gh/hosts.yml
	new file:   .gitconfig
	new file:   .gitignore

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git restore <file>..." to discard changes in working directory)
	modified:   .config/.DS_Store

Untracked files not listed (use -u option to show untracked files)
mandalarian@mandalarian ~> dm rm --cached .config/.DS_Store
error: the following file has staged content different from both the
file and the HEAD:
    .config/.DS_Store
(use -f to force removal)


# looks like I have some unwanted `.DS_Store files
~> dm rm --cached -f .config/.DS_Store
rm '.config/.DS_Store'
~> dm rm --cached -f .config/fish/.DS_Store
rm '.config/fish/.DS_Store'
~>
```

## TLDR
[automatic installation script](./scripts/dotfiles-install.fish):

```bash
curl -fsSL https://dm.idkjs.vercel.app/install | fish
```

## Template/Fork

Click the template button or fork this repo.

Have at it!

## Installation

[fisherman](https://github.com/jorgebucaran/fisher)(recommended)

```bash
fisher install idkjs/dm
```

Run `git init --bare $HOME/.dotfiles`
Open a new terminal and run:

```
dm config --local status.showUntrackedFiles no`
```
## Manually

1. Run
```bash
git clone idkjs/dm
```
2. Run
```bash
make
```
or

```
cp conf.d/dm.fish ~/.config/fish/conf.d/
```

Run `git init --bare $HOME/.dotfiles`
Open a new terminal and run `dm config --local status.showUntrackedFiles no`


## Portability

If you need your config on a remote machine, just download your git repository and repeat the steps.

On new machine assuming you already have fish installed:

```bash
fisher install idkjs/dm
echo ".dotfiles" >> .gitignore
git clone --bare <git-repo-url> $HOME/.dotfiles
```

Checkout the actual content from the bare repository to your $HOME:

### dm status
```bash

~/.dotfiles (BARE:main)> dm status
On branch main

No commits yet

nothing to commit (create/copy files and use "git add" to track)
~/.dotfiles (BARE:main)>
```
### dm checkout
```bash

~/.dotfiles (BARE:main)> dotfiles status
On branch main

No commits yet

nothing to commit (create/copy files and use "git add" to track)
~/.dotfiles (BARE:main)>
```

## Uninstalling

To uninstall run:

```bash
rm -f $HOME/.config/fish/conf.d/dm.fish
```
or
```
make uninstall
```

## Resources

[git-bare-ssh](https://gist.github.com/joahking/780877)
[PatrickF1/dotfiles for deployment](https://github.com/PatrickF1/dotfiles)

[quotes in fish docs](https://fishshell.com/docs/2.4/index.html#quotes)

[echo variable name is `\$HOME`](http://unix.stackexchange.com/questions/129084/ddg#129113)

[string-expansion](https://stackoverflow.com/questions/65132069/how-to-combine-text-with-expanded-variable-into-a-variable-expansion-in-fish)

[fish-article](https://mvolkmann.github.io/fish-article/)

[`wraps` doesnt tak an `=` sign](https://fishshell.com/docs/current/cmds/alias.html?highlight=wraps#example)

[use-exit-status-of-command-in-fish-function](https://dev.to/talha131/use-exit-status-of-command-in-fish-function-2lj1)

[The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles)

[fish-shell playground](https://rootnroll.com/d/fish-shell/)
[https://github.com/afq984/dotfiles](https://github.com/afq984/dotfiles)
[fishshell-gitter](https://gitter.im/fish-shell/fish-shell)
[Figglewatts/dotfiles](https://github.com/Figglewatts/dotfiles/blob/master/install.fish)
[skybro/dotfiles](https://github.com/sky-bro/.dotfiles/blob/master/README.md)
[uses `set -l`/set local within function scope](https://github.com/tsujamin/dotfiles/blob/main/.config/fish/functions/dotfile.fish)

[pre-commit-hook](https://github.com/gazorby/fish-git-check-id/blob/master/functions/gckid.fish)

## License

[MIT](LICENSE.md)
