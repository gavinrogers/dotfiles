xrdb ~/.Xresources
eval $(gpg-agent --enable-ssh-support --daemon)
xmodmap ~/.speedswapper
setxkbmap -model acer_laptop -layout gb
exec startkde
