

# dm

> 100% pure-<a href="https://fishshell.com" title="Portable Minimal Dotfiles ">fish</a> portable minimal dotfiles manager.

- fish implementation of [The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles) imagined by [StreakyCobra](https://news.ycombinator.com/item?id=11071754).
-
## Usage

```bash
dm status
dm add .vimrc
dm commit -m "Add vimrc"
dm add .bashrc
dm commit -m "Add bashrc"
dm push
```
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
## TLDR
[automatic installation script](./scripts/dotfiles-install.fish):

```bash
curl -fsSL https://dm.idkjs.vercel.app/install | fish
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
[quotes in fish docs](https://fishshell.com/docs/2.4/index.html#quotes)

[echo variable name is `\$HOME`](http://unix.stackexchange.com/questions/129084/ddg#129113)

[string-expansion](https://stackoverflow.com/questions/65132069/how-to-combine-text-with-expanded-variable-into-a-variable-expansion-in-fish)

[fish-article](https://mvolkmann.github.io/fish-article/)

[`wraps` doesnt tak an `=` sign](https://fishshell.com/docs/current/cmds/alias.html?highlight=wraps#example)

[use-exit-status-of-command-in-fish-function](https://dev.to/talha131/use-exit-status-of-command-in-fish-function-2lj1)

[The best way to store your dotfiles: A bare Git repository](https://www.atlassian.com/git/tutorials/dotfiles)

[fish-shell playground](https://rootnroll.com/d/fish-shell/)

## License

[MIT](LICENSE.md)
