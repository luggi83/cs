
#source ~/.commacd.bash
source ~/.bash_aliases
source ~/.bashrc

#export DOCKER_TLS_VERIFY="1"
#export DOCKER_HOST="tcp://127.0.0.1:2376"

export GOPATH=$HOME/go
export GOROOT=/usr/lib/go
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin:$PATH
export PATH=$PATH:/usr/games
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  

eval `keychain --eval --agents ssh id_rsa`

	#test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

	#export PATH='/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin':"$PATH"


	sudo chown lukas /var/run/docker.sock

#if [[ -z "$TMUX" ]] && [ "$SSH_CONNECTION" != "" ]; then
#    byobu attach-session -t ssh-byobu || byobu new-session -s ssh-byobu
#fi


#export PATH="$HOME/.cargo/bin:$PATH"

#if ( tmux has-session -t thename ); then
#        tmux attach -t beelink
#else
#        tmux new-session -s thename
#fi


# Check for interactive bash and that we haven't already been sourced.
if [ -n "${BASH_VERSION-}" -a -n "${PS1-}" -a -z "${BASH_COMPLETION_VERSINFO-}" ]; then

    # Check for recent enough version of bash.
    if [ ${BASH_VERSINFO[0]} -gt 4 ] || \
       [ ${BASH_VERSINFO[0]} -eq 4 -a ${BASH_VERSINFO[1]} -ge 1 ]; then
        [ -r "${XDG_CONFIG_HOME:-$HOME/.config}/bash_completion" ] && \
            . "${XDG_CONFIG_HOME:-$HOME/.config}/bash_completion"
        if shopt -q progcomp && [ -r /usr/share/bash-completion/bash_completion ]; then
            # Source completion code.
            . /usr/share/bash-completion/bash_completion
        fi
    fi

fi


if [ -z "$homepc" ] && [ -n $(cat $HOME/.homepc) ]; then 
export homepc=$(cat $HOME/.homepc)
fi

