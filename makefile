CFGROOT := $(shell pwd)
HOSTNAME := $(shell hostname)
all: bin dzen misc tmux vim xdefaults xsession xmonad zsh 
shell: bin misc tmux vim xdefaults zsh 
bin:
	rm -rf ${HOME}/.bin
	ln -fs $(CFGROOT)/bin ${HOME}/.bin
misc:
	ln -fs $(CFGROOT)/gitconfig ${HOME}/.gitconfig
tmux:
	ln -fs $(CFGROOT)/tmux.conf ${HOME}/.tmux.conf
dzen:
	ln -s ${CFGROOT}/dzen ${HOME}/.dzen
vim:
	rm -rf ${HOME}/.vim/autoload
	rm -rf ${HOME}/.vim/bundle
	ln -fs $(CFGROOT)/vimrc ${HOME}/.vimrc
	ln -fs $(CFGROOT)/vim/autoload ${HOME}/.vim/autoload
	ln -fs $(CFGROOT)/vim/bundle ${HOME}/.vim/bundle
xdefaults:
	ln -fs $(CFGROOT)/Xresources ${HOME}/.Xresources
xsession:
	ln -fs $(CFGROOT)/xsession ${HOME}/.xsession
xmonad:
	ln -fs $(CFGROOT)/xmonad.hs ${HOME}/.xmonad/xmonad.hs
compton:
	ln -fs $(CFGROOT)/compton.conf ${HOME}/.config/compton.conf
zsh:
	ln -fs $(CFGROOT)/zshrc ${HOME}/.zshrc
	ln -fs $(CFGROOT)/zsh/alias ${HOME}/.zsh/alias
uninstall:
	rm -rf ${HOME}/.bin
	rm -rf ${HOME}/.vim
	rm ${HOME}/.vimrc
	rm ${HOME}/.Xresources
	rm ${HOME}/.xsession
	rm ${HOME}/.xmonad/xmonad.hs
	rm ${HOME}/.zshrc
	rm ${HOME}/.gitconfig
	rm ${HOME}/.tmux.conf
	rm ${HOME}/.config/compton.conf
