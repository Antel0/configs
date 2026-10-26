# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc


########################################################################## MY MODIFICATIONS ################################################################################
                                                                         # ENV VARIABLES
# SET nvim AS DEFAULT EDITOR 
export EDITOR='/usr/bin/nvim'
# NOT A SYSTEM VARIABLE (path to .config dir)
export CONFIG="$HOME/.config"
# NOT A SYSTEM VARIABLE (path to the configs repository)
export CONFIGS="$HOME/Documents/configs/"
                                                                         # ALIASES
# aliases
### ls
alias la='ls -a'
### tree
alias trea='tree -a -I ".git"'
alias pnvim="nvim -c 'setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile' -"

                                                                         # FUNCTIONS
# -----------------------------------------------------------------------------
# path_add: Safely append or prepend a directory to $PATH without duplicates.
#
# Usage:
#   path_add "/path/to/dir"         # Prepends (takes precedence)
#   path_add "/path/to/dir" after   # Appends (fallback/lower priority)
# -----------------------------------------------------------------------------
path_add() {
    # Only add if the directory exists and isn't already in PATH
    if [ -d "$1" ] && [[ ":$PATH:" != *":$1:"* ]]; then
        if [ "$2" = "after" ]; then
            export PATH="$PATH:$1"
        else
            export PATH="$1:$PATH"
        fi
    fi
}
# -----------------------------------------------------------------------------
# dir_diff: Recursively compare two files or directories using Git's diff engine
#           and display the unified diff stream inside Neovim (or a pager alias).
#
# Usage:
#   dir_diff <path_a> <path_b>
# -----------------------------------------------------------------------------
dir_diff() {
    # 1. Argument validation:
    #    Ensure exactly two arguments are provided to prevent unexpected errors.
    if [ "$#" -ne 2 ]; then
        echo "Usage: dir_diff <dir1|file1> <dir2|file2>" >&2
        return 1
    fi
    git diff --no-index $1 $2 | pnvim
}
                                                                         # PATH
#   golang
path_add "/usr/local/go/bin" after		                                            # to be able to use go
path_add "$(go env GOPATH)/bin"	after                                               # to be able to use tools installed with "go install"
path_add "/home/carlos/.local/share/nvim/mason/bin" after                           # nvim mason
path_add "/home/carlos/Public/v" after                                              # vlang

