if status is-interactive
    # Commands to run in interactive sessions can go here
end

function yy
    set tmp (mktemp -t "yazi-cwd.XXXXXX")
    yazi $argv --cwd-file="$tmp"
    if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
        cd -- "$cwd"
    end
    rm -f -- "$tmp"
end

function cargo-update-all
    cargo install $(cargo install --list | egrep '^[a-z0-9_-]+ v[0-9.]+:$' | cut -f1 -d' ')
end

set -gx EDITOR /opt/homebrew/bin/hx

alias grep='rg'
alias cat='bat'
alias ll='ls -FGlAhp' # Preferred 'ls' implementation
alias less='less -FSRXc' # Preferred 'less' implementation
alias cd..='cd ../' # Go back 1 directory level (for fast typers)
alias ..='cd ../' # Go back 1 directory level
alias ...='cd ../../' # Go back 2 directory levels
alias .3='cd ../../../' # Go back 3 directory levels
alias .4='cd ../../../../' # Go back 4 directory levels
alias .5='cd ../../../../../' # Go back 5 directory levels
alias .6='cd ../../../../../../' # Go back 6 directory levels
alias f='open -a Finder ./' # f:            Opens current directory in MacOS Finder
alias which='type --all' # which:        Find executables

function cd
    builtin cd $argv
    ll
end

starship init fish | source
