#
# ~/.bashrc
#

# ec2 setup:
export CHEF_REPO=~/bg/chef/
export IDENT_FILE=~/.ssh/gavinrogers-aws.pem

export PERL5LIB=/home/scourge/perl5/lib/perl5:/home/scourge/git/cil/lib:$PERL5LIB
export EDITOR=/usr/bin/vim


PATH="$(ruby -e 'puts Gem.user_dir')/bin:$PATH"

#if [ -f ~/.gem/ruby/2.1.0/bin ] ; then
  PATH=~/.gem/ruby/2.1.0/bin:"${PATH}"
#fi
#if [ -f ~/bin ] ; then
  PATH=~/bin:"${PATH}"
#fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '


# gpg tty info
GPG_TTY=$(tty)
export GPG_TTY

#aliases

# User specific aliases and functions
#calc () { awk "BEGIN { print $* }" };

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias vi=vim
alias grep='grep --color=auto'
alias dmesg='dmesg -HL'
#export TERM=ansi

alias gojenkins='ssh gavinrogers@ec2-54-216-63-95.eu-west-1.compute.amazonaws.com'

alias goslave1='ssh gavinrogers@37.187.131.164'
alias auth_tunnel='AUTOSSH_POLL=10 autossh -A -M 20010 gmr@devel.thermeon.com'

validate_yaml() {
  ruby -ryaml -e "YAML.load_file '$1'"
}

validate_erb() {
  erb -P -x -T '-' $1 | ruby -c
}

#SSHAGENT=/usr/bin/ssh-agent
#SSHAGENTARGS="-s"
#if [ -z "$SSH_AUTH_SOCK" -a -x "$SSHAGENT" ]; then
#  eval `$SSHAGENT $SSHAGENTARGS`
#  trap "kill $SSH_AGENT_PID" 0
#fi
if [ -z "$SSH_AUTH_SOCK" ]
then
  eval $(ssh-agent)
  ssh-add ~/.ssh/id_rsa
fi


source ~/ansible/hacking/env-setup -q
