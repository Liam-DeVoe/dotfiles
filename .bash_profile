######################
## Customize Colors ##
######################

export PS1="\[\e[00;96m\] \w \[\e[0m\]\[\e[00;92m\]λ \[\e[0m\]"
#export PS1="________________________________________________________________________________\n| \[\033[36m\]\u:\[\033[33;1m\]\w\[\033[m\] => "
export PS2="| => "
export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx



#####################
## Eternal History ##
#####################

# from https://stackoverflow.com/a/19533853/12164878
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] " # only matters for the ``history`` command, doesn't actually change the ~/.bash_history file format which is always unix time
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"



########################
## Path Modifications ##
########################

# python 3.7
export PATH=/Library/Frameworks/Python.framework/Versions/3.7/bin:$PATH
# python 3.9
export PATH=/Library/Frameworks/Python.framework/Versions/3.9/bin:$PATH
# python 3.10
export PATH="/opt/homebrew/opt/python@3.10/bin:$PATH"
# java (currently java 18)
# export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
# java 17
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
# racket + racket tools
export PATH=/Applications/Racket\ v7.8/bin:$PATH
# prolog + prolog tools
export PATH=/Applications/SWI-Prolog.app/Contents/MacOS:$PATH
# use brew ruby
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
# coq
export PATH=/Applications/Coq.app/Contents/Resources/bin:$PATH
# personal scripts
export PATH=$HOME/bin:$PATH


###########################
## Environment Variables ##
###########################

# see https://stackoverflow.com/a/17886334/12164878 and https://stackoverflow.com/a/1348940/12164878.
# TODO is this the right path??
export JAVA_HOME="/opt/homebrew/opt/openjdk@17"
# remove annoying "please change to zsh" warning (I should probably switch to zsh at some point,
# but a task for another day)
export BASH_SILENCE_DEPRECATION_WARNING=1



##########
## Misc ##
##########

# start at desktop, not the home directory. This is where I want to be most of the time
# https://superuser.com/a/193516
if [[ $PWD/ = $HOME/ ]]; then
	cd Desktop/
fi

# add homebrew paths to PATH
# I used to run `eval "$(/opt/homebrew/bin/brew shellenv)"``, but that takes ~20ms to run on every
# shell startup, which is not that bad but still much slower than I would like. The following is
# the output of the above command.
# May need to be updated in the future if/when I update brew.
export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";

# set up thefuck https://github.com/nvbn/thefuck
# I used to run `eval "$(thefuck --alias)"`, but that takes ~135ms to run on every shell
# startup, which I found unnaceptable. So the following is just the output of `thefuck --alias`.
# May need to be updated in the future if I ever update thefuck.
function fuck () {
  TF_PYTHONIOENCODING=$PYTHONIOENCODING;
  export TF_SHELL=bash;
  export TF_ALIAS=fuck;
  export TF_SHELL_ALIASES=$(alias);
  export TF_HISTORY=$(fc -ln -10);
  export PYTHONIOENCODING=utf-8;
  TF_CMD=$(
      thefuck THEFUCK_ARGUMENT_PLACEHOLDER "$@"
  ) && eval "$TF_CMD";
  unset TF_HISTORY;
  export PYTHONIOENCODING=$TF_PYTHONIOENCODING;
  history -s $TF_CMD;
}

# https://apple.stackexchange.com/a/55886
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# makes autocomplete (tab) consider case insensitive options (https://askubuntu.com/q/87061).
# Mostly useful for cd'ing to folders which I can't remember whether I capitalized them or not
bind 'set completion-ignore-case on'

# activate z (https://github.com/rupa/z)
. /Users/tybug/bin/z.sh


#############
## Aliases ##
#############

# I store all my aliases in a separate file, so add them now.
# NOTE: this depends on git-completion.bash being sourced, as we use the __git_complete function defined theirin.
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

# sensitive / private aliases go in a separate file; I publicize everything else
if [ -f ~/.bash_aliases_private ]; then
  source ~/.bash_aliases_private
fi

# use our current shell for this script so we can immediately add our new alias to our shell when we call this
# https://stackoverflow.com/a/44122806
# alias alias='. alias-permanent'

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH



# node 14 (remove this export to use node 18)
export PATH="/opt/homebrew/opt/node@14/bin:$PATH" 