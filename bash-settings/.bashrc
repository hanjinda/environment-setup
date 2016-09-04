eval "$(rbenv init -)"

export EDITOR='subl -w'
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Show git branch. From http://effectif.com/git/config
__git_ps1 ()
{
    local b="$(git symbolic-ref HEAD 2>/dev/null)";
    if [ -n "$b" ]; then
        printf " (%s)" "${b##refs/heads/}";
    fi
}

# Show local pyenv.
__pyenv ()
{
    local p="$(pyenv local 2>/dev/null)";
    # echo $p
    p="${p##*/}"
    # echo $p
    if [ "$p" == ""  ]; then
        printf "";
    else
        printf " {%s}" "${p}";
    fi
    # printf $p
}

# Command prompt settings
color_prompt=yes;

# If you want to show full path to directory replace \W with \w.
# A shorter way for showing the full path http://unix.stackexchange.com/a/26885
if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[1;33m\]$(__pyenv "(%s)")\[\033[1;31m\]$(__git_ps1 "(%s)")\[\033[00m\]\$'
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\W$(__pyenv "(%s)")$(__git_ps1 "(%s)")\$ '
fi
unset color_prompt

# Alias definitions are in a separate file.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi


