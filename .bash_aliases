#####################
## Custom Commands ##
#####################

alias t='python3 -m unittest'
alias d='open -a Finder /Users/tybug/Desktop/Liam/coding/tybug/data/ok'
alias f='open -a Finder ./'
alias bashrc='open -a Finder /Users/tybug/.bash_profile'
alias aliases='open -a Finder /Users/tybug/.bash_aliases'
alias ..='cd ../'

# cd shortcuts
alias comfy='cd /Users/tybug/Desktop/Liam/Music/singles\ \(comfy\)'
alias singles='cd /Users/tybug/Desktop/Liam/Music/singles'
alias trance='cd /Users/tybug/Desktop/Liam/Music/singles\ \(trance\)'

# git shortcuts
alias p='git push'
alias pu='git pull'
alias gst='git status'
alias gb='git branch'
alias lg='git lg'
alias gl='git lg'
alias gt='git tag'
alias gc='git checkout'
alias gs='git switch'



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
alias python3='python3.9'
alias pip='pip3.9'

# others
alias dott='dot -o output.png -T png'
# https://raspberrypi.stackexchange.com/a/34594/110108
alias findpi='arp -na | grep -i b8:27:eb'
alias fuck='fuck --yeah'
