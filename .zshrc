export ZSH=/Users/manout/.oh-my-zsh

ZSH_THEME="robbyrussell"

export UPDATE_ZSH_DAYS=30

DISABLE_AUTO_TITLE="true"

# ENABLE_CORRECTION="true"

COMPLETION_WAITING_DOTS="true"

HIST_STAMPS="mm/dd/yyyy"

plugins=(git colored-man colorize pip python3 
		brew osx zsh-syntax-highlighting zsh-autosuggestion
		zsh-completions)

source $ZSH/oh-my-zsh.sh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# Env configuration

export GOROOT=/usr/local/Cellar/go/1.11.4/libexec
export GOPATH=/Users/manout/go

# nodejs env
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh



# User configuration

export MANPATH="/usr/local/man:$MANPATH"
export fpath=(/usr/local/share/zsh-completions $fpath)
# You may need to manually set your language environment
export LANG=zh_CN.UTF-8
export PATH=$GOPATH/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

eval $(thefuck --alias cao )
eval "$(pyenv init -)"

# add zsh-syntax-highlighting
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# add autojump
source /usr/local/Cellar/autojump/22.5.1/share/autojump/autojump.zsh



# Compilation flags
# export ARCHFLAGS="-arch x86_64"
export LDFLAGS="-L/usr/local/opt/qt/lib"
export CPPFLAGS="-I/usr/local/opt/qt/include"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -v'
alias ln='ln -v'
alias mkdir='mkdir -v'
alias cmatrix='cmatrix -b'
alias :q='echo "You are not in vim"'
alias ipython='ipython --pylab'
alias ipython3='ipython3 --pylab'
alias gcc='g++'
alias blog_build='hexo clean && hexo g'
alias blog_deploy='hexo clean && hexo g && hexo d'
alias vim='mvim'
alias blog_commit='git add --all && git commit -m "$(date)" && git push origin master'
alias updatedb='sudo usr/libexec/locate.updatedb'
