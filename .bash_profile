# start at desktop, not the home directory. This is where I want to be most of the time
# https://superuser.com/a/193516
cd Desktop/

# see https://stackoverflow.com/a/17886334/12164878 and https://stackoverflow.com/a/1348940/12164878. Change if you want to use java 11 instead of 8
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.8.0_231.jdk/Contents/Home"
# for circleguard test cases
export OSU_API_KEY='REDACTED'
# for ossapi test cases
export OSU_API_CLIENT_ID='3762'
export OSU_API_CLIENT_SECRET='REDACTED'

# taken vastly from https://gist.github.com/natelandau/10654137 -tybug, 01/01/2019

export PS1="\[\e[00;96m\] \w \[\e[0m\]\[\e[00;92m\]λ \[\e[0m\]"
#export PS1="________________________________________________________________________________\n| \[\033[36m\]\u:\[\033[33;1m\]\w\[\033[m\] => "
export PS2="| => "


#   Set default blocksize for ls, df, du
#   from this: http://hints.macworld.com/comment.php?mode=view&cid=24491
#   ------------------------------------------------------------
export BLOCKSIZE=1k

export CLICOLOR=1
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx

# https://old.reddit.com/r/osx/comments/cmm2on/catalina_suppress_zsh_warning/ew3a1hg/
export BASH_SILENCE_DEPRECATION_WARNING=1

# Setting PATH for Python 3.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.7/bin:${PATH}"
export PATH
# adding racket + racket tools to command line
export PATH=/Applications/Racket\ v7.8/bin:$PATH
# adding prolog + prolog tools to command line
export PATH=/Applications/SWI-Prolog.app/Contents/MacOS:$PATH

# thefuck (https://github.com/nvbn/thefuck) won't work unless I do this unfortunately
eval "$(thefuck --alias)"

alias grep='grep -i'
alias p='git push'
alias pu='git pull'
alias gst='git status'
alias gb='git branch'
alias lg='git lg'
alias gl='git lg'
alias gt='git tag'
alias gc='git checkout'
alias gs='git switch'
alias ll='ls -FGlAhp'                       # Alternative `ls` command with more information
alias cp='cp -iv'
alias mv='mv -iv'
# cd() { builtin cd "$@"; ll; }             # Always list directory contents upon 'cd'
alias cd..='cd ../'                         # Go back 1 directory level (for fast typers)
alias ..='cd ../'                           # Go back 1 directory level
alias ...='cd ../../'                       # Go back 2 directory levels
alias .3='cd ../../../'                     # Go back 3 directory levels
alias .4='cd ../../../../'                  # Go back 4 directory levels
alias .5='cd ../../../../../'               # Go back 5 directory levels
alias .6='cd ../../../../../../'            # Go back 6 directory levels
alias f='open -a Finder ./'                 # f:            Opens current directory in finder
alias fuck='fuck --yeah'
alias key='echo REDACTED | pbcopy' # put osu! api key into clipboard
alias youtube-dla='youtube-dl --extract-audio --audio-format mp3 --audio-quality 0 --no-mtime --output %"(title)s.%(ext)s"'
alias dla='youtube-dla'
alias dl='youtube-dl -f best'
alias dott='dot -o output.png -T png'
alias findpi='arp -na | grep -i b8:27:eb'   # https://raspberrypi.stackexchange.com/a/34594/110108
alias python3='python3.9'
alias pip='pip3.9'
# use our current shell for this script so we can immeditaely add our new alias to our shell when we call this
# https://stackoverflow.com/a/44122806
alias alias='. alias-permanent'

# https://apple.stackexchange.com/a/55886
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# from https://stackoverflow.com/a/19533853/12164878
# Eternal bash history.
# ---------------------
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

# opam configuration
test -r /Users/tybug/.opam/opam-init/init.sh && . /Users/tybug/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true

export PATH=/Users/tybug/.local/bin:$PATH

# add any alises stored in this additional file, if it exists

if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

# Setting PATH for Python 3.9
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.9/bin:${PATH}"
export PATH
# haskell stuff which they automatically added when I installed haskell, not sure what it does exactly
[[ -f ~/.bashrc ]] && source ~/.bashrc # ghcup-env
export PATH="/usr/local/opt/ruby/bin:$PATH"
