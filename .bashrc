#!/bin/bash
# .bashrc
# Chris Cera
###############################################################################
# ORDER: global, other, local -- SOURCE other .bashrc files
# This is no longer honored
###############################################################################

# tex vars I've been ignoring for some time now
# TEXINPUTS - point to style files, and stuff
# BIBINPUTS
# TEXBIB=$BIBINPUTS 


rcfiles=(/etc/bashrc)

let index=0
while [ $index -lt ${#rcfiles[@]} ]; do
    if [ -f ${rcfiles[$index]} ]; then
#          echo "sourcing ${rcfiles[$index]}"
        . ${rcfiles[$index]}
    fi
    let index=index+1
done

#rcfiles=(/etc/bashrc)
#
#let index=0
#while [ $index -lt ${#rcfiles[@]} ]; do
#    if [ -f ${rcfiles[$index]} ]; then
##          echo "sourcing ${rcfiles[$index]}"
#        . ${rcfiles[$index]}
#    fi
#    let index=index+1
#done

stty erase ^\? 2> /dev/null > /dev/null
stty erase ^H 2> /dev/null > /dev/null
stty erase ^\H 2> /dev/null > /dev/null
stty erase  2> /dev/null > /dev/null
stty erase ^? 2> /dev/null > /dev/null

set -o vi

# Jeff A says:  Meanwhile, add this line to your .bashrc
shopt -s cdspell

alias emacs='emacs -nw'
#alias vi='emacs'
alias gv='gv -watch'
alias mp='mplayer -loop 0 -vop scale=640:480'
alias mpn='mplayer -loop 0 -vop scale=640:480 -nosound'
alias mps='mplayer -loop 0 -fps 5'
alias j='wine .wine/drive_c/Program\ Files/DavidRM\ Software/The\ Journal\ 4/Journal4.exe'
#export MANPATH=/usr/X11R6/man:$MANPATH

alias p='ping google.com'

###############################################################################
# GLOBAL EXPORTS
###############################################################################

export PATH="~/bin:/usr/local/bin/:/usr/bin:/bin:/usr/X11R6/bin:$PATH"
export PATH="$PATH:/usr/sbin:/sbin"
export MANPATH="$MANPATH:/usr/local/man"

export NNTPSERVER=news.mcs.drexel.edu
export MOZILLA_HOME="/usr/local/netscape"
export TMPDIR=/tmp
export MAILTMP="~/doc/mail/tmp"
export MAIL="~/mail/mbox"

###############################################################################
# OTHER INDEPENDENT OPTIONS
###############################################################################

# 777-744 = 033, makes all new files rw-r--r--, # default is 002
umask 007

#set host=`hostname | sed s/\\..\*//`
# set history=200


###############################################################################
# SYSTEM INDEPENDENT ALIAS
#     - this doesn't mean the system has all the software, its path just isn't
#       hard coded.
###############################################################################

######################################################
# GEORGE GLOBALS
######################################################

alias t='tail'
alias m='gmake'
alias h='head -20'
alias sl="ls"
alias sls="lsl"
alias lst="ls -gost"
alias lst5='ls -gost | head -6'
alias subd='ls -dC \*/'
alias up='cd ..'
alias hh='history -r | head '
alias wcl='wc -l'
alias gnews='w3m http://news.google.com/news/gnmainlite.html'
alias slash='w3m http://www.slashdot.org'

######################################################
# END GEORGE GLOBALS
######################################################

alias a2psdat='a2ps --list-options'
alias a2psdup1='a2ps -s2 --medium=Letter --rows=1 --columns=1 --portrait --output=-'
alias a2ps1='a2ps --rows=1 --columns=1 --medium=Letter --portrait --output=-'
alias a2ps21='a2ps --landscape --rows=2 --medium=Letter --columns=1 --output=-'
alias a2ps12='a2ps --landscape --rows=1 --medium=Letter --columns=2 --output=-'
alias a2ps22='a2ps --landscape --rows=2 --medium=Letter --columns=2 --output=-'
alias a2ps32='a2ps --landscape --rows=3 --medium=Letter --columns=2 --output=-'
alias a2ps42='a2ps --landscape --rows=4 --medium=Letter --columns=2 --output=-'
#alias a2pscode'a2ps -8 -g --tabsize=1 --landscape --rows=1 --medium=Letter --columns=2 --output=-'
alias gzip='gzip -9'
alias sendmenow='sendmail -t -oi'
#alias fetch='fetchmail --all'
alias mozz='mozilla >& /dev/null &'
alias c='clear'
alias showps='gv'

# alias ls='ls -s --color -p'
alias ls='ls -s -p -G'
alias lsl='\ls -pl --color'
alias lsa='ls -asF'
alias lsd='\ls -pl --color | grep '^d''
alias lslinks='\ls -pl --color | grep '^l''
alias lsblocks='ls -pls'
alias lsinodes='ls -pli'
alias lssize='ls | sort -n'
alias lsme='ls -liad'  # good to check permissions
alias lshidden="\ls -a | grep '^\.' | grep -v '^\.$' | grep -v '^\.\.$'"

alias cls='clear;\ls --color'

alias coloroff='export LS_COLORS='

alias more='less'



###############################################################################
# LOCAL STUFF, source this last
###############################################################################

#export LS_COLORS="no=00:fi=00:di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jpg=01;35:*.png=01;35:*.gif=01;35:*.bmp=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.png=01;35:*.mpg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:"
# does orange
#no=00:fi=00:di=01;34:ln=01;38:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jpg=01;35:*.png=01;35:*.gif=01;35:*.bmp=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.png=01;35:*.mpg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;38:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.gz=01;31:*.bz2=01;31:*.deb=01;31:*.rpm=01;31:*.jpg=01;35:*.png=01;35:*.gif=01;35:*.bmp=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.png=01;35:*.mpg=01;35:*.avi=01;35:*.fli=01;35:*.gl=01;35:*.dl=01;35:';

export EDITOR="vim"

alias lynx='lynx -vikeys'

alias s='screen'
alias sls='screen -ls'
alias sr='screen -r'
alias sx='screen -x'

# xmms stuff
alias xnrr='xmms-nav --rewrand'
alias xnro='xmms-nav --rewone'
alias xnfr='xmms-nav --fwdrand'
alias xnfo='xmms-nav --fwdone'
alias xnt='xmms-now -t'
alias n='xmms-nav --fwdrand && sleep 1 && xnt'
export CVS_RSH=ssh

# dict.org stuff
alias dictm='dict -m lev'
alias dictml='dict -m lev'
alias dictms='dict -m soundex'
alias dictmf='dict -m re'

alias gnews='w3m http://news.google.com/news/gnmainlite.html'

alias atm='aterm -geometry 80x60+0+0 -fn 9x15 -tr -sh 105 +sb -txttype nand -cr white'

alias nautilus='nautilus --disable-sound --no-desktop'
export LD_LIBRARY_PATH=.:$LD_LIBRARY_PATH

# bash prompt section

function show_bash_prompt {
  local BN="\[\033[0;30m\]" #BROWN
  local RD="\[\033[0;31m\]" #RED
  local OG="\[\033[0;32m\]" #ORANGE
  local YW="\[\033[0;33m\]" #YELLOW
  local BL="\[\033[0;34m\]" #BLACK i think this is really blue
  local PL="\[\033[0;35m\]" #PURPLE
  local GN="\[\033[0;36m\]" #GREEN
  local WT="\[\033[0;37m\]" #WHITE
  local BD="\[\033[0;38m\]" #BOLD
  local NC="\[\033[0m\]"    #NO_COLOR

# FOR THE TITLEBAR AT THE TOP OF THE WINDOW
  case $TERM in
      xterm*)
          TITLEBAR='\[\033]0;\u@\h:\w\007\]'
          ;;
      *)
          TITLEBAR=""
          ;;
  esac

#  PS1="${TITLEBAR}\
#  $BL[$WT\$(date +%H%M)$BL]\
#  $BL[$WT\u@\h:\w$BL]\
#  $WT\$$NC "
#  PS2='> '
#  PS4='+ '

  #PS1="${TITLEBAR}$GN[$GN\$(date +%H%M)$GN] $RD[$WT\u@$\h$GN:$WT\w$RD]$WT\$$NC "
  #PS1="${TITLEBAR}$BL[$BL\$(date +%H%M)$BL] $RD[$GN\u@\h$BL:$GN\w$RD]$GN\$$NC "  #PS1="${TITLEBAR}$BL[$BL\@$BL] $RD[$PL\u@$BL\h$BL:$GN\w$RD]$GN\$$NC "

  # stuff from craig's titlebar is at the end
#PS1="${TITLEBAR}$BL[$BL\$(date +%H%M)$BL] $RD[$PL\u$YW@$BL\h$BL:$GN\w$RD]\n$RD$ $NC" #\[\e[0m\] \[\e]2;\d - \t \u \ #\# << \h >> \w\a\]"

# at hotel: !!!
#PS1="$BK[$RD\u $BL\h$BL $RD\w$BK]\n$ $NC" #\[\e[0m\] \[\e]2;\d - \t \u \ #\# << \h >> \w\a\]"

  PS1="${TITLEBAR}$BL[$BL\$(date +%H%M)$BL] $RD[$PL\u$YW@$BL\h$BL:$GN\w$RD]\n$RD$ $NC" #\[\e[0m\] \[\e]2;\d - \t \u \ #\# << \h >> \w\a\]"

  PS2='> '
  PS4='+ '
}

show_bash_prompt


# fixes issues with putty formatting in windows, slightly different solution
# https://bbs.archlinux.org/viewtopic.php?pid=511920
if [ "$TERM" = "screen" ]; then
  export LC_ALL=C
fi
