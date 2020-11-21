#~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

if [ -d "penséeDuJour" ]; then
    penséeDuJour/penséeDuJour.sh
fi

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
#[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

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
force_color_prompt=yes

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

export COLOR_NC='\e[0m' # No Color
export COLOR_WHITE='\e[1;37m'
export COLOR_BLACK='\e[0;30m'
export COLOR_BLUE='\e[0;34m'
export COLOR_LIGHT_BLUE='\e[1;34m'
export COLOR_GREEN='\e[0;32m'
export COLOR_LIGHT_GREEN='\e[1;32m'
export COLOR_CYAN='\e[0;36m'
export COLOR_LIGHT_CYAN='\e[1;36m'
export COLOR_RED='\e[0;31m'
export COLOR_LIGHT_RED='\e[1;31m'
export COLOR_PURPLE='\e[0;35m'
export COLOR_LIGHT_PURPLE='\e[1;35m'
export COLOR_BROWN='\e[0;33m'
export COLOR_YELLOW='\e[1;33m'
export COLOR_GRAY='\e[0;30m'
export COLOR_LIGHT_GRAY='\e[0;37m'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
fi

ls --color=al > /dev/null 2>&1 && alias ls='ls -F --color=al' || alias ls='ls -G'
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
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/lib/x86_64-linux-gnu/
export EPNETDEV_PATH=~/projects/phd/EPNet/epnet-dev/141110-TradeAndCulture/

# Add environment variable ANT_ROOT for cocos2d-x
export ANT_ROOT=/usr/share/ant/bin
export PATH=$ANT_ROOT:$PATH
export CXX=/usr/bin/g++
export PHDEV=~/projects/PhD/dev
export PHDOC=~/projects/PhD/doc
export PHDORA=~/projects/PhD/dev/jm/epn
export PHD=projects/PhD/

#un bon shell mais faudrait changer les couleurs la c'est laid
PS1="\[${COLOR_YELLOW}\]me\[${COLOR_LIGHT_PURPLE}\]@${HOSTNAME::3}\[${COLOR_LIGHT_BLUE}\]:$(p=${PWD/$HOME/"~"};((${#p}>120))&&echo "${p::51} ~@ ${p:(-40)}"||echo "\w")\n\[${COLOR_LIGHT_GRAY}\]$\[${COLOR_NC}\] "

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting (perle stuff)


##Start 
alias tunnelisya='bash .tunnelisya.sh'


alias remap='xmodmap -e "keycode  54 = c C c C v V c C copyright v"'

#export GDAL_ROOT=/opt/gdal-1.10.1
#export LD_LIBRARY_PATH=${GDAL_ROOT}/lib/:${LD_LIBRARY_PATH}
#
#export HDF5_ROOT=/opt/hdf5-1.8.19/
#export LD_LIBRARY_PATH=${HDF5_ROOT}/lib/:${LD_LIBRARY_PATH}
#
#export GDAL_ROOT=/opt/gdal-1.10.1
#export LD_LIBRARY_PATH=${GDAL_ROOT}/lib/:${LD_LIBRARY_PATH}
#
#export PANDORAPATH=/opt/pandora/
#export PYTHONPATH=/opt/pandora//bin:/opt/pandora//bin:

GPG_TTY=$(tty)
export GPG_TTY

