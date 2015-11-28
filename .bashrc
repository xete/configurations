# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

color_prompt=yes
#if [ "$color_prompt" = yes ]; then
    #PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
#else
    #PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
#fi
#unset color_prompt force_color_prompt

# '\033' == '\e'
# '\!' -- history
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\e[01;34m\]\u\[\e[00;36m\]@\[\e[0;90m\]ubunt\[\e[00;95m\](\[\e[01;95m\]`date +%H:%M`\[\e[00;95m\]) \[\e[01;96m\]\W\[\033[00;36m\]\$\[\e[0m\] '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# personal tools
PATH=~/personal/:$PATH

# set java environment
export JAVA_HOME=/opt/java/jdk1.8.0_51
export JRE_HOME=$JAVA_HOME/jre
export CLASSPATH=./:$CLASSPATH:$JAVA_HOME/lib:$JRE_HOME/lib
PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin:$JAVA_HOME/lib:$JAVA_HOME

# set android environment
ANDROID_DIR=$HOME/merge/android
ANDROID_HOME=$ANDROID_DIR/android-sdk-linux
GRANDLE_HOME=$ANDROID_DIR/gradle
export ANDROID_HOME
export GRANDLE_HOME 
PATH=$PATH:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools:$GRANDLE_HOME/bin

# set xtensa
PATH=/opt/esp-open-sdk/xtensa-lx106-elf/bin:$PATH

# set sublime text
PATH=/opt/Sublime_Text_2/:$PATH

# set libopencv
# /* origin version opencv2 */
# PATH=/usr/local/include:/usr/local/lib/opencv:$PATH
# LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
# newly installed opencv3
OPENCV_3_PATH=/opt/opencv-3.0.0/build/install
PATH=$OPENCV_3_PATH/include:$OPENCV_3_PATH/lib:$PATH
LD_LIBRARY_PATH=$OPENCV_3_PATH/lib:$LD_LIBRRARY_PATH
PKG_CONFIG_PATH=$OPENCV_3_PATH/lib/pkgconfig	# feeding pkg-config



# set Qt Creator
export QTDIR=/opt/Qt5.5.1
PATH=$QTDIR/5.5/gcc_64/include:$QTDIR/5.5/gcc_64/bin:$QTDIR/Tools/QtCreator/bin:$PATH 
LD_LIBRARY_PATH=$QTDIR/5.5/gcc_64/lib:$LD_LIBRARY_PATH

# cuda
PATH=$PATH:/usr/local/cuda-7.0/bin
LD_LIBRARY_PATH=/usr/local/cuda-7.0/lib64:/usr/local/cuda/lib64:$LD_LIBRARY_PATH
PYTHONPATH=$PYTHONPATH:$HOME/Downloads/cuda/caffe/python
PATH=/usr/local/cuda/bin:$CUDA_HOME/bin:/usr/local/cuda/bin:$PATH
export PYTHONPATH

# torch source
. $HOME/Downloads/Torch/torch/install/bin/torch-activate

# golang
export GOPATH=$HOME/gitcode/hybridgroup

# auto completion for avoscloud
# source ~/.MY_ENV/.leancloud_completion.sh

# set system proxy
# export http_proxy='http://127.0.0.1:1080'
# export https_proxy='http://127.0.0.1:1080'

# export ONCE is okay,
# otherwise repetition occurs.
export PATH
export LD_LIBRARY_PATH
export PKG_CONFIG_PATH

