# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH=/home/manout/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=30

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
 HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
 export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
export OPENCV_TEST_DATA_PATH=/home/manout/opencv_extra/testdata

eval $(thefuck --alias cao )

#alias sudo="sudo env PATH=$PATH"

# add cuda nvcc path
export PATH=$PATH:/usr/local/cuda/bin/

# add anaconda path
#export PATH=$PATH:/home/manout/anaconda3/bin

#add /home/manout/bin
export PATH=$PATH:/home/manout/bin
# intel icc script path
#export PATH=$PATH:/opt/intel/bin


export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib:/usr/local/lib
# link mkl library, do not need now
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/intel/lib/intel64:/opt/intel/mkl/lib/intel64

# after add /usr/libl/x86_64-linux-gnu to the LD_LIBRARY_PATH, anaconda-navigator crashs when every time start 
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/x86_64-linux-gnu


# after add /home/manout/anaconda3/lib to LD_LIBRARY_PATH, ssh reports a warning message when execute
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/home/manout/anaconda3/lib

# add zsh-syntax-highlighting
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

export JAVA_HOME=/usr/lib/jvm/java-8-oracle/jre

export PATH=$PATH:$JAVA_HOME/bin

export CLASSPATH=$CLASSPATH:.

# add antlr classpath
export CLASSPATH=$CLASSPATH:/usr/local/lib/antlr-4.7-complete.jar

export CLASSPATH=$CLASSPATH:/usr/share/java

# add rust
source $HOME/.cargo/env

# personal alias
alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -v'
alias rmdir='rmdir -v'
alias ln='ln -v'
alias chmod='chmod -c'
alias chown='chown -c'
alias mkdir='mkdir -v'
alias checkupdate='sudo apt update && apt list --upgradable'
alias cmatrix='cmatrix -b'
#alias anaconda-navigator="nohup anaconda-navigator 2> /dev/null &"
alias ddd='nohup  ddd 2> /dev/null &'
alias openfile='xdg-open'
alias :q='echo "You are not in vim"'
alias gephi='nohup  $HOME/gephi-0.9.3-SNAPSHOT/bin/gephi 2> /dev/null &'
alias ipython='ipython --pylab'
alias ipython3='ipython3 --pylab'

# perf alias
alias perf='sudo perf'
alias perf-annotate='sudo perf annotate'
alias perf-archive='sudo perf archive'
alias perf-bench='sudo perf bench'
alias perf-buildid-cache='sudo perf buildid-cache'
alias perf-buildid-list='sudo perf buildid-list'
alias perf-config='sudo perf config'
alias perf-data='sudo perf data'
alias perf-diff='sudo perf diff'
alias perf-evlist='sudo perf evlist'
alias perf-inject='sudo perf inject'
alias perf-kmem='sudo perf kmem'
alias perf-kvm='sudo perf kvm'
alias perf-list='sudo perf list'
alias perf-lock='sudo perf lock'
alias perf-mem='sudo perf mem'
alias perf-record='sudo perf record'
alias perf-report='sudo perf report'
alias perf-sched='sudo perf sched'
alias perf-script='sudo perf script'
alias perf-stat='sudo perf stat'
alias perf-test='sudo perf test'
alias perf-timechart='sudo perf timechart'
alias perf-top='sudo perf top'
alias perf-probe='sudo perf probe'
alias perf-trace='sudo perf trace'

# alias for antlr
alias antlr4='java -jar /usr/local/lib/antlr-4.7-complete.jar'
alias grun='java org.antlr.v4.gui.TestRig'

#export VIMRUNTIME=/usr/share/vim/vim74
