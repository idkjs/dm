all:
	cp conf.d/dotfiles.fish ~/.config/fish/conf.d/

uninstall:
	rm -f ~/.config/fish/conf.d/dotfiles.fish
