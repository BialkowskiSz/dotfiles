#!/bin/bash
#   Credit:
#       github.com/jessfraz/dotfiles

profile_file='/usr/share/defaults/etc/profile'
if [[ -r "$profile_file" ]]; then
    # shellcheck disable=SC1090
    source "$profile_file";
fi
unset profile_file

eval "$(dircolors ~/.dir_colors)"

#   Add go bin to path
PATH=$PATH:~/go/bin

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob

# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Allow bash recursive globbbing
shopt -s globstar

# Check window size after each command
shopt -s checkwinsize

#   Tab case insensitive autocompletion
bind 'set completion-ignore-case on'

# List all matches in case multiple possible completions are possible
bind 'set show-all-if-ambiguous on'

# Show all autocomplete results at once
bind 'set page-completions off'

# If there are more than n possible completions for a word, ask to show them all
bind 'set completion-query-items 200'

# Show extra file information when completing, like `ls -F` does
bind 'set visible-stats on'

# Allows cycling through options
bind 'TAB':menu-complete

# Partial completion of first tab, cycling on second onwards
bind "set menu-complete-display-prefix on"

# Prevent completing a command at the cursor and leaving the text after
# cd ~/etc   ->   cd ~/etctc
bind "set skip-completed-text on"

for file in ~/.{aliases,functions,exports}; do
    if [[ -r "$file" ]]; then
        # shellcheck disable=SC1090
        source "$file"
    fi
done
unset file
