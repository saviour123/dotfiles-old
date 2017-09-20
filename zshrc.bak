if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vi'
else
  export EDITOR='vim'
fi

export TERM='xterm-256color'
export CHROME_REMOTE_DESKTOP_DEFAULT_DESKTOP_SIZES=960x540

source $HOME/antigen.zsh

antigen use oh-my-zsh

# Bundles
antigen bundle git
antigen bundle github
antigen bundle python
antigen bundle virtualenv
antigen bundle pip
antigen bundle npm
antigen bundle node
antigen bundle heroku
antigen bundle ipython
antigen bundle command-not-found
antigen bundle zsh-users/zsh-syntax-highlighting


# Theme
# ZSH_THEME=robbyrussell
antigen theme https://github.com/caiogondim/bullet-train-oh-my-zsh-theme bullet-train
antigen apply
# export ZSH_THEME=robbyrussell

# For theme: override virtualenv display config
BULLETTRAIN_VIRTUALENV_PREFIX='⚡'

case `uname` in
    Darwin)
        # darwin path
        export PATH=/usr/local/bin:/usr/local/sbin:$PATH

        # iterm2 shell integration
        test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
        ;;
    Linux)
        # Android SDK
        export ANDROID_HOME=/home/sav/android-sdk/sdk

        # Paths
        export PATH="~/android-sdk/sdk/platform-tools:~/android-sdk/sdk/tools:/usr/local/bin:/bin:/usr/bin:/usr/sbin:/sbin:/usr/lib/jvm/java-7-openjdk-amd64"

        # Python path
        # export PYTHONPATH=$PYTHONPATH:/usr/local/lib/python2.7/site-packages

        # Games
        export PATH=$PATH:/usr/games

        # Linux brew, new package manager
        export PATH="$HOME/.linuxbrew/bin:$PATH"
        export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
        export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

        # autoenv
        if [ -f ~/.linuxbrew/opt/autoenv/activate.sh ]; then
            source ~/.linuxbrew/opt/autoenv/activate.sh
        fi

        # Android Studio
        export PATH="$HOME/android-studio/bin:$PATH"

        # java8 home
        export JAVA8_HOME=/usr/lib/jvm/java-8-openjdk-amd64

        # Go App Engine Path
        # export PATH=$PATH:$HOME/go_appengine/


        ### Added by the Heroku Toolbelt
        # export PATH="/usr/local/heroku/bin:$PATH"
        ;;
esac



# git-flow-completion
# install git-flow with apt-get
# http://jeffkreeftmeijer.com/2010/why-arent-you-using-git-flow/
# http://nvie.com/posts/a-successful-git-branching-model/
# source $HOME/git-flow-completion.zsh

# Aliases
alias aria='aria2c --file-allocation=none -c -x 10'
alias al='aria2c --file-allocation=none --force-sequential=true -c -x 10 -i'
alias aria_list='aria2c --file-allocation=none --force-sequential=true -c -x 10 -i'
alias chrome=google-chrome-unstable
alias hdmi='xrandr --output HDMI1 --auto --right-of LVDS1'
alias lock='i3lock -c #1e90ff'
alias reload_sound='pulseaudio -k && sudo alsa force-reload'
alias route_sound='pactl load-module module-loopback'
alias settings=gnome-control-center
alias unroute_sound='pactl unload-module module-loopback'
alias vga='xrandr --output VGA-1 --auto --right-of LVDS-1'
alias vga_same='xrandr --output VGA-1 --auto --same-as LVDS-1'
alias server='python3 -m http.server'
alias server='python -m SimpleHTTPServer 2000'
alias docker='sudo docker'
alias venv='source /home/sav/github/venv/bin/activate'
alias nautilus='nautilus --no-desktop'
alias mk=mkdir
alias theme='antigen theme robbyrussell'
alias postman='/home/sav/Postman/Postman'
alias upgrade='sudo apt-get update && sudo apt-get upgrade'
alias clean='sudo apt-get autoclean && sudo apt-get autoremove'
alias rm='rm -rf'
alias suspend='systemctl suspend'
alias android-st='/opt/android-studio/bin/studio.sh'
alias ipython='ipython3'

ng_opts='b build completion doc e2e g generate get github-pages:deploy gh-pages:deploy h help i init install lint make-this-awesome new s serve server set t test v version -h --help'

build_opts='--aot --base-href --environment --output-path --suppress-sizes --target --watch --watcher -bh -dev -e -o -prod -t -w'
generate_opts='class component directive enum module pipe route service c cl d e m p r s --help'
github_pages_deploy_opts='--base-href --environment --gh-token --gh-username --message --skip-build --target --user-page -bh -e -t'
help_opts='--json --verbose -v'
init_opts='--dry-run inline-style inline-template --link-cli --mobile --name --prefix --routing --skip-bower --skip-npm --source-dir --style --verbose -d -is -it -lc -n -p -sb -sd -sn -v'
new_opts='--directory --dry-run inline-style inline-template --link-cli --mobile --prefix --routing --skip-bower --skip-git --skip-npm --source-dir --style --verbose -d -dir -is -it -lc -p -sb -sd -sg -sn -v'
serve_opts='--aot --environment --host --live-reload --live-reload-base-url --live-reload-host --live-reload-live-css --live-reload-port --open --port --proxy-config --ssl --ssl-cert --ssl-key --target --watcher -H -e -lr -lrbu -lrh -lrp -o -p -pc -t -w'
set_opts='--global -g'
test_opts='--browsers --build --code-coverage --colors --lint --log-level --port --reporters --watch -cc -l -w'

version_opts='--verbose'

if test ".$(type -t complete 2>/dev/null || true)" = ".builtin"; then
  _ng_completion() {
    local cword pword opts

    COMPREPLY=()
    cword=${COMP_WORDS[COMP_CWORD]}
    pword=${COMP_WORDS[COMP_CWORD - 1]}

    case ${pword} in
      ng) opts=$ng_opts ;;
      b|build) opts=$build_opts ;;
      g|generate) opts=$generate_opts ;;
      gh-pages:deploy|github-pages:deploy) opts=$github_pages_deploy_opts ;;
      h|help|-h|--help) opts=$help_opts ;;
      init) opts=$init_opts ;;
      new) opts=$new_opts ;;
      s|serve|server) opts=$serve_opts ;;
      set) opts=$set_opts ;;
      t|test) opts=$test_opts ;;
      v|version) opts=$version_opts ;;
      *) opts='' ;;
    esac

    COMPREPLY=( $(compgen -W '${opts}' -- $cword) )

    return 0
  }

  complete -o default -F _ng_completion ng
elif test ".$(type -w compctl 2>/dev/null || true)" = ".compctl: builtin" ; then
  _ng_completion () {
    local words cword opts
    read -Ac words
    read -cn cword
    let cword-=1

    case $words[cword] in
      ng) opts=$ng_opts ;;
      b|build) opts=$build_opts ;;
      g|generate) opts=$generate_opts ;;
      gh-pages:deploy|github-pages:deploy) opts=$github_pages_deploy_opts ;;
      h|help|-h|--help) opts=$help_opts ;;
      init) opts=$init_opts ;;
      new) opts=$new_opts ;;
      s|serve|server) opts=$serve_opts ;;
      set) opts=$set_opts ;;
      t|test) opts=$test_opts ;;
      v|version) opts=$version_opts ;;
      *) opts='' ;;
    esac

    setopt shwordsplit
    reply=($opts)
    unset shwordsplit
  }

  compctl -K _ng_completion ng
else
  echo "Shell builtin command 'complete' or 'compctl' is redefined; cannot perform ng completion."
  return 1
fi

###-end-ng-completion###

# export HISTCONTROL=erasedups
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/sav/.sdkman"
[[ -s "/home/sav/.sdkman/bin/sdkman-init.sh" ]] && source "/home/sav/.sdkman/bin/sdkman-init.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/sav/Downloads/google-cloud-sdk/path.zsh.inc' ]; then source '/home/sav/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/sav/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then source '/home/sav/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
