source ./.tweak/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

eval `dircolors .dircolors`

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

antigen theme funky

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Tell antigen that you're done.
antigen apply



export WORKON_HOME=/usr/local/share/venvs
export PROJECT_HOME=$HOME/projects
source /usr/local/bin/virtualenvwrapper.sh
