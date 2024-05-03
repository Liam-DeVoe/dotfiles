#####################
## Custom Commands ##
#####################

alias t='python3 -m pytest'
alias p8='python3 -m pytest -n 8 hypothesis-python/tests/'
alias coverage='./build.sh check-coverage'
alias p1='python3 -m pytest hypothesis-python/tests/'
alias format='./build.sh format'
alias run='python3 manage.py runserver'
alias f='open -a Finder ./'
alias bashrc='open -e /Users/tybug/.bash_profile'
alias aliases='open -e /Users/tybug/.bash_aliases'
alias aliases-private='open -e /Users/tybug/.bash_aliases_private'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
# cd to the path of the currently open finder window
alias cdc='cd "$(current_finder_path)"'
alias c='cdc'
# download the current chrome url
alias dlac='dla $(current_chrome_url)'
alias dlc='dl $(current_chrome_url)'
alias lazer='python3 /Users/tybug/Desktop/Liam/coding/scrape_lazer_market_share/scrape_lazer_market_share.py'
alias sha256='shasum -a 256'

function until_failure {
	while $1; do :; done
} 

# cd shortcuts
alias comfy='cd /Users/tybug/Desktop/Liam/Music/singles\ \(comfy\)'
alias singles='cd /Users/tybug/Desktop/Liam/Music/singles'
alias trance='cd /Users/tybug/Desktop/Liam/Music/singles\ \(trance\)'

# git shortcuts
function _git_alias {
	alias $1="git ${2}"
	# set up autocomplete
	__git_complete $1 _git_$2
} 

_git_alias p push
_git_alias pu pull
_git_alias gst status
_git_alias gb branch
_git_alias lg lg
_git_alias gl lg
_git_alias gt tag
_git_alias gc checkout
_git_alias gs switch
_git_alias gd diff
_git_alias gcp cherry-pick


##########################
## Customizing Builtins ##
##########################

alias grep='grep -i'
alias cp='cp -iv'
alias mv='mv -iv'
alias ll='ls -FGlAhp'
alias du='du -hs'
alias df='df -h'



#######################
## Customizing Tools ##
#######################

# yt-dlp (aka youtube-dl)
alias yt-dla='yt-dlp --extract-audio --no-mtime --output %"(title)s.%(ext)s"'
alias dla='yt-dla'
alias dl='yt-dlp'
alias yt-dlp='yt-dlp --recode-video "mkv>mp4/webm>mp4"'

alias python3='python3.12'
alias python='python3'
alias pip='python3 -m pip'
# older python versions, while things move to supporting 3.12
# alias python3.11='/opt/homebrew/Cellar/python@3.11/3.11.5/bin/python3.11'
# alias pip3.11='/opt/homebrew/Cellar/python@3.11/3.11.5/bin/pip3.11'
alias pyinstrument='pyinstrument -r html'

# others
alias dott='dot -o output.png -T png'
# https://raspberrypi.stackexchange.com/a/34594/110108
alias findpi='arp -na | grep -i b8:27:eb'
alias fuck='fuck --yeah'
alias j='jconsole'