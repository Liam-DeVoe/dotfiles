#####################
## Custom Commands ##
#####################

alias t='python3 -m unittest'
alias run='python3 manage.py runserver'
alias d='open -a Finder /Users/tybug/Desktop/Liam/coding/tybug/data/ok'
alias f='open -a Finder ./'
alias bashrc='open -a Finder /Users/tybug/.bash_profile'
alias aliases='open -a Finder /Users/tybug/.bash_aliases'
alias aliases-private='open -a Finder /Users/tybug/.bash_aliases_private'
alias ..='cd ../'
# cd to the path of the currently open finder window
alias cdc='cd "$(current_finder_path)"'
alias c='cdc'
# download the current chrome url
alias dlac='dla $(current_chrome_url)'
alias dlc='dl $(current_chrome_url)'
alias lazer='python3 /Users/tybug/Desktop/Liam/coding/scrape_lazer_market_share/scrape_lazer_market_share.py'

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


##########################
## Customizing Builtins ##
##########################

alias grep='grep -i'
alias cp='cp -iv'
alias mv='mv -iv'
alias ll='ls -FGlAhp'



#######################
## Customizing Tools ##
#######################

# yt-dlp (aka youtube-dl)
alias yt-dla='yt-dlp --extract-audio --audio-format mp3 --audio-quality 0 --no-mtime --output %"(title)s.%(ext)s"'
alias dla='yt-dla'
alias dl='yt-dlp -f best'
# my install doesn't have SSl certificates set up right or something, I should probably fix that but in the meantime just ignore it
alias yt-dlp='yt-dlp --no-check-certificates'


# python
alias python3='python3.10'
alias pip='pip3.10'

# others
alias dott='dot -o output.png -T png'
# https://raspberrypi.stackexchange.com/a/34594/110108
alias findpi='arp -na | grep -i b8:27:eb'
alias fuck='fuck --yeah'
# always print output when running pytest https://stackoverflow.com/a/14414325/12164878
alias pytest='pytest -s'