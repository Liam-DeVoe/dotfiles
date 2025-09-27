#####################
## Custom Commands ##
#####################

alias t='python3 -m pytest'
alias p8='python3 -m pytest -n 8 hypothesis-python/tests/'
alias coverage='./build.sh check-coverage'
# libcst and pandas take 370ms and 280ms respectively to load (under pyinstrument, at least). Ignore these on p1, where we want fast collection times.
alias p1='python3 -m pytest hypothesis-python/tests/ --ignore=hypothesis-python/tests/codemods --ignore=hypothesis-python/tests/patching --ignore=hypothesis-python/tests/pandas'
alias pp1='python3 -m pytest hypothesis-python/tests/'
alias format='./build.sh format'
alias run='python3 manage.py runserver'
alias f='open -a Finder ./'
alias bashrc='open -e /Users/tybug/.bash_profile'
alias aliases='open -e /Users/tybug/.bash_aliases'
alias aliases-private='open -e /Users/tybug/.bash_aliases_private'
alias git-aliases='open -e /Users/tybug/.gitconfig'
alias gitaliases='open -e /Users/tybug/.gitconfig'
alias git-config='open -e /Users/tybug/.gitconfig'
alias gitconfig='open -e /Users/tybug/.gitconfig'
alias l='ls'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias ......='cd ../../../../../'
alias .......='cd ../../../../../../'
alias ........='cd ../../../../../../../'
alias .........='cd ../../../../../../../../'
alias ..........='cd ../../../../../../../../../'
alias ...........='cd ../../../../../../../../../../'
# cd to the path of the currently open finder window
alias cdc='cd "$(current_finder_path)"'
alias c='cdc'
# download the current chrome url
alias dlac='dla $(current_chrome_url)'
alias dlc='dl $(current_chrome_url)'
alias lazer='python3 /Users/tybug/Desktop/Liam/coding/scrape_lazer_market_share/scrape_lazer_market_share.py'
alias sha256='shasum -a 256'
alias library='cd $HOME/Library'
alias site-packages='open /opt/homebrew/lib/python3.12/site-packages'
alias sitepackages=site-packages
alias hypothesisdocs='open /Users/tybug/Desktop/Liam/coding/hypothesis/hypothesis-python/docs/_build/html/index.html'
alias hypofuzzdocs='open /Users/tybug/Desktop/Liam/coding/hypofuzz/src/hypofuzz/frontend/public/docs/index.html'

function until_failure {
	while $1; do :; done
}

# cd shortcuts
alias comfy='cd /Users/tybug/Desktop/Liam/Music/singles\ \(comfy\)'
alias singles='cd /Users/tybug/Desktop/Liam/Music/singles'
alias trance='cd /Users/tybug/Desktop/Liam/Music/singles\ \(trance\)'


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
alias pytest='python3 -m pytest'
alias python='python3'
alias pip='python3 -m pip'
# older python versions, while things move to supporting 3.12
# alias python3.11='/opt/homebrew/Cellar/python@3.11/3.11.5/bin/python3.11'
# alias pip3.11='/opt/homebrew/Cellar/python@3.11/3.11.5/bin/pip3.11'
# alias pyinstrument='pyinstrument -r html'

# https://github.com/anthropics/claude-code/issues/4260
alias claude='claude --permission-mode acceptEdits'
streamlit() {
    command streamlit "$@" --server.headless true
}

# others
alias dott='dot -o output.png -T png'
# https://raspberrypi.stackexchange.com/a/34594/110108
alias findpi='arp -na | grep -i b8:27:eb'
alias fuck='fuck --yeah'
alias j='jconsole'


###########
## Typos ##
###########

alias pyest=pytest


#########
## git ##
#########

function _git_alias {
	alias $1="git ${2}"
	# set up autocomplete
	__git_complete $1 _git_$2
}

_git_alias p push
_git_alias pp "push --no-verify"
_git_alias pu pull
_git_alias gst status
_git_alias gb branch
_git_alias lg lg
_git_alias gl lg
_git_alias gt tag
_git_alias gc checkout
_git_alias gd diff
_git_alias gcp cherry-pick
_git_alias gfa "fetch --all"
# short for "git undo", as my shorthand for vscode's "undo last commit" command.
_git_alias gu "reset --soft HEAD~1"

alias gs=~/bin/git_switch_warn_on_todo
__git_complete gs _git_switch

# `squash` undoes the most commit, adds the working tree to the now-undone commit's changes, and re-commits with the same commit message.
_squash() {
    local commit_message=$(git log -1 --pretty=%B 2>/dev/null)
    git reset --soft HEAD~1
    git add .
    git commit -m "$commit_message"
}

alias squash='_squash'


# overriding `git` subcommands themselves with custom behavior
gclone() {
    command git clone "$@"

    if [ $? -eq 0 ]; then
        local repo_dir=$(basename "${@: -1}" .git)

        if cd "$repo_dir" 2>/dev/null; then
            if command git rev-parse --verify main >/dev/null 2>&1; then
                command git symbolic-ref refs/heads/master refs/heads/main
                echo "Created symbolic ref: master -> main"
            fi

            cd ..
        fi
    fi
}
gstash() {
    case "$1" in
        pop|show|drop|list)
            command git stash "$@"
            ;;
        *)
            command git stash --include-untracked "$@"
            ;;
    esac
}
git() {
    case "$1" in
        clone)
            shift  # Remove 'clone' from arguments
            gclone "$@"
            ;;
        stash)
            shift  # Remove 'stash' from arguments
            gstash "$@"
            ;;
        *)
            # run all other commands normally
            command git "$@"
            ;;
    esac
}
