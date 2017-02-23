CFGROOT := $(shell pwd)
HOSTNAME := $(shell hostname)
all: bin dircolors git vim zsh 
bin:
	rm -rf ${HOME}/.bin
	ln -fs $(CFGROOT)/bin ${HOME}/.bin
dircolors:
	ln -fs $(CFGROOT)/dircolors ${HOME}/.dircolors
	
git:
	ln -fs $(CFGROOT)/gitconfig ${HOME}/.gitconfig
vim:
	ln -fs $(CFGROOT)/vimrc ${HOME}/.vimrc
zsh:
	ln -fs $(CFGROOT)/zshrc ${HOME}/.zshrc
uninstall:
	rm -rf ${HOME}/.bin
	rm -rf ${HOME}/.vim
	rm ${HOME}/.vimrc
	rm ${HOME}/.gitconfig
	rm ${HOME}/.zshrc
	rm ${HOME}/.dircolors
	
