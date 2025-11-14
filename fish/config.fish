source /usr/share/cachyos-fish-config/cachyos-config.fish

# overwrite greeting
# potentially disabling fastfetch
#function fish_greeting
#    # smth smth
#end

alias llt4='lsd -l --tree --depth 4'
alias lt4='lsd --tree --depth 4'
alias cdf='cd (find . -type d 2> /dev/null | fzf)'
