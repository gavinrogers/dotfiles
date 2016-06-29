#
# ~/.bash_profile
#

#alias startx='ssh-agent startx'

[[ -f ~/.bashrc ]] && . ~/.bashrc

#eval $(ssh-agent)
export PATH="$HOME/.plenv/bin:$PATH"
eval "$(plenv init -)"
if [ -e /Users/gavin/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/gavin/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
