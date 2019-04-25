#!/bin/bash

iatest=$(expr index "$-" i)
if [[ $iatest > 0 ]]; then

source ~/.bashhub/bashhub.sh


function gethomepc(){
if [ -z $homepc ]; then
last_homepc=$(cat $HOME/.homepc)
echo "No homepc set. Last homepc was $last_homepc." 
read -p "What is the current homepc? (Enter to use $last_homepc): " input
if [ -z $input ]; then
export homepc=$last_homepc
echo "homepc: $homepc"
else
export homepc=$input
echo $homepc > $HOME/.homepc
echo "homepc: $homepc"
fi
else
echo "homepc set as: " $homepc
#read -p "Change homepc value (Enter to keep current)? " input
if [ -z $1 ]; then
echo "to change, call gethomepc again new homepc as only argument"
else
export homepc=$1
echo $homepc > $HOME/.homepc
echo "homepc changed to "  $homepc
fi
fi
}
export -f gethomepc

#[ -r /home/lukas/.byobu/prompt ] && . /home/lukas/.byobu/prompt

#[[ -s "$HOME/.qfc/bin/qfc.sh" ]] && source "$HOME/.qfc/bin/qfc.sh"


if [ !  "$TERM" == "xterm-256color" ]; then
    # No it isn't, it's gnome-terminal
    export TERM=xterm-256color
fi 
#source /usr/games/autojump/etc/profile.d/autojump.sh
source $HOME/.bash_aliases
#source $HOME/.bash_completion
source /usr/share/bash-completion/bash_completion

eval "$(fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install)"
#fasd_cache="$HOME/.fasd-init-bash"
#if [ "$(command -v fasd)" -nt "$fasd_cache" -o ! -s "$fasd_cache" ]; then
#  fasd --init posix-alias bash-hook bash-ccomp bash-ccomp-install >| "$fasd_cache"
#fi
#source "$fasd_cache"
#unset fasd_cache


#PATH="/home/lukas/perl5/bin${PATH:+:${PATH}}"; export PATH;
#PERL5LIB="/home/lukas/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
#PERL_LOCAL_LIB_ROOT="/home/lukas/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
#PERL_MB_OPT="--install_base \"/home/lukas/perl5\""; export PERL_MB_OPT;
#PERL_MM_OPT="INSTALL_BASE=/home/lukas/perl5"; export PERL_MM_OPT;


#eval $(thefuck --alias)

fi



export PATH=$PATH:/usr/games:/usr/games/AppImages

#set +x
#exec 2>&3 3>&-

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

notica() { curl --data "d:$*" "https://notica.us/?LMti4yDB" ; }

# HSTR configuration - add this to ~/.bashrc
alias hh=hstr                    # hh to be alias for hstr
export HSTR_CONFIG=hicolor       # get more colors
shopt -s histappend              # append new history items to .bash_history
export HISTCONTROL=ignorespace   # leading space hides commands from history
export HISTFILESIZE=1000000        # increase history file size (default is 500)
export HISTSIZE=${HISTFILESIZE}  # increase history size (default is 500)
# ensure synchronization between Bash memory and history file
export PROMPT_COMMAND="history -a; history -n; ${PROMPT_COMMAND}"
# if this is interactive shell, then bind hstr to Ctrl-r (for Vi mode check doc)
if [[ $- =~ .*i.* ]]; then bind '"\C-r": "\C-a hstr -- \C-j"'; fi


[ -r /home/lukas/.byobu/prompt ] && . /home/lukas/.byobu/prompt