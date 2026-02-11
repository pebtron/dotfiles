# zsh specific stuff

# Make meta-delete work
autoload -U select-word-style
select-word-style bash

# Retain / added after auto-completing directories
setopt no_auto_remove_slash

# Exports
export GPG_TTY=$(tty)
export PATH="$PATH:$HOME/bin:/usr/local/bin:/usr/local/sbin"
PATH=$PATH:$HOME/bin
if [ -d /opt/puppetlabs/bin ]; then
  PATH=$PATH:/opt/puppetlabs/bin
fi
export EDITOR='vim'
export VISUAL='vim'
export HISTCONTROL="ignorespace"
export HISTFILESIZE=1000
export HISTIGNORE="&:ls:ls -al:[bf]g:exit"
export HISTSIZE=1000
export SAVESIZE=1000
setopt APPEND_HISTORY

# SSL inspect
function sslinspect () {
  echo '\n' \
    | openssl s_client -connect ${1}:${2:-443} 2>&1 \
    | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' \
    | openssl x509 -noout -subject -dates
}

# SSL multi
function sslmulti () {
  openssl crl2pkcs7 -nocrl -certfile ${1} \
    | openssl pkcs7 -print_certs -noout
}

## SSL chain dump
function sslchaindump () {
  while openssl x509 -noout -text; do :; done < ${1}
}

# SSL SAN
function sslsan () {
  echo \
    | openssl s_client -connect ${1}:${2:-443} 2>&1 \
    | openssl x509 -noout -text \
    | awk -F, -v OFS="\n" '/DNS:/{x=gsub(/ *DNS:/, ""); $1=$1; print $0}'
}

# Source bt tools
test -f ~/.bash/bt.sh && source ~/.bash/bt.sh

# Aliases
alias grep='grep --color=auto'
alias umutt='mutt -F ~/.mutt/muttrc-uc'
alias tmux='tmux -2'

# http://drupal.star.bnl.gov/STAR/blog-entry/jeromel/2009/feb/06/how-safely-start-ssh-agent-bashrc
test=`ps uxw | grep ssh-agent | grep -v grep  | awk '{print $2}' | xargs`
if [ "$test" = "" ]; then
   # there is no agent running
   if [ -e "$HOME/agent.sh" ]; then
      # remove the old file
      rm -f $HOME/agent.sh
   fi
   # start a new agent if wanted
   if [ -f ~/.bash/use_agent ]; then
     ssh-agent | grep -v echo >& $HOME/agent.sh
   fi
fi
test -e $HOME/agent.sh && source $HOME/agent.sh
alias kagent="kill -9 $SSH_AGENT_PID"
alias sadd='ssh-add -t28800'

# Mac OS X
if [[ `uname` == "Darwin" ]]; then
  alias ls='ls -aFG' # colors
  alias ll='ls -alG' # colors
  export GREP_COLOR="1;36"
  ulimit -n 8192 # mutt on Mac needs lots of open files
else
  eval "`dircolors -b`"
  alias ls='ls -aF --color=auto'
  alias ll='ls -al --color=auto'
  export GREP_COLOR="mt=1;36"
fi

# Prompt
eval "$(starship init zsh)"
