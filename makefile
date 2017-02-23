CFGROOT := $(shell pwd)
HOSTNAME := $(shell hostname)
all: bin git vim zsh 
bin:
	rm -rf ${HOME}/.bin
	ln -fs $(CFGROOT)/bin ${HOME}/.bin
git:
	ln -fs $(CFGROOT)/gitconfig ${HOME}/.gitconfig
vim:
	rm -rf ${HOME}/.vim/autoload
	rm -rf ${HOME}/.vim/bundle
	ln -fs $(CFGROOT)/vimrc ${HOME}/.vimrc
	ln -fs $(CFGROOT)/vim/autoload ${HOME}/.vim/autoload
	ln -fs $(CFGROOT)/vim/bundle ${HOME}/.vim/bundle
zsh:
	ln -fs $(CFGROOT)/zshrc ${HOME}/.zshrc
uninstall:
	rm -rf ${HOME}/.bin
	rm -rf ${HOME}/.vim
	rm ${HOME}/.vimrc
	rm ${HOME}/.gitconfig
