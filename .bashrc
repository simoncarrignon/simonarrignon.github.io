#~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples


# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# don't overwrite GNU Midnight Commander's setting of `ignorespace'.
export HISTCONTROL=$HISTCONTROL${HISTCONTROL+,}ignoredups
 # ... or force ignoredups and ignorespace
export HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
#une bonne methode trouvé sur l'internet is to set les deux variable HIST* à rien : $export HISTFILESIZE= HISTSIZE=

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
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


if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
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

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

#if [ -f ~/.bash_aliases ]; then
#    . ~/.bash_aliases
#fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    #alias grep='grep --color=auto'
    #alias fgrep='fgrep --color=auto'
    #alias egrep='egrep --color=auto'
fi

# some more ls aliases
#alias ll='ls -l'
#alias la='ls -A'
alias l='ls -CF'
alias lrt='ls -lrt'
alias univconnect='ssh carrigns@frontal.iro.umontreal.ca'
alias connectserv_home='ssh 192.168.0.10'
alias connectserv_outside='ssh simon@elisya.org'
alias letsmusicgoeson_home='sshfs simon@192.168.0.10:/Musique/ /Musique/'
alias letsmusicgoeson_outside='sshfs simon@elisya.org:/Musique/ /Musique/'
alias loftProj_load='sshfs jason@elisya.org:/var/www /home/simon/WebDvp/loftProject/'
alias khepera_connect='rfcomm connect 0'
alias seclec='sshfs u58312393@seconde-lecture.fr:. /home/simon/WebDvp/secondeLecture'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# On mets le mode d'insertion de bash façon VI
set -o vi

# On utilise vim comme éditeur principal parcequ'on est pas des chiens!
export EDITOR=vim

export PANDORAPATH=/usr/local/pandora
export PATH=$PATH:$PANDORAPATH/bin/
export JAVAPATH=/usr/java/
export PATH=$PATH:$JAVAPATH
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$PANDORAPATH/lib/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/hdf5/lib/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/hdf5/include/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/x86_64-linux-gnu/
export EPNETDEV_PATH=~/projects/PhD/EPNet/epnet-dev/141110-TradeAndCulture/


# Add environment variable COCOS_CONSOLE_ROOT for cocos2d-x
export COCOS_CONSOLE_ROOT=/home/scarrign/projects/cocos2d-x-3.8.1/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH

# Add environment variable COCOS_TEMPLATES_ROOT for cocos2d-x
export COCOS_TEMPLATES_ROOT=/home/scarrign/projects/cocos2d-x-3.8.1/templates
export PATH=$COCOS_TEMPLATES_ROOT:$PATH

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/usr/share/ant/bin
export PATH=$ANT_ROOT:$PATH
export CXX=/usr/bin/gcc-4.9
export PHDEV=~/projects/PhD/dev
export PHDOC=~/projects/PhD/doc
export PHDORA=~/projects/PhD/dev/jm/epn
export PHD=projects/PhD/
