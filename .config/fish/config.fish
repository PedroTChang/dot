set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"
alias g git
alias nvim-default='nvim'
alias ovi='env NVIM_APPNAME=OVIWrite nvim'
alias dot='git --git-dir=$HOME/.dot --work-tree=$HOME'
command -qv nvim && alias vim nvim
# command -qv OVIwrite && alias

set -gx EDITOR nvim

set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH ~/.scripts/ $PATH

# Rust
set -gx PATH ~/.cargo/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Go
set -g GOPATH $HOME/go
set -gx PATH $GOPATH/bin $PATH

# asdf
source ~/.asdf/asdf.fish

# bare dotfiles
source ~/.config/fish/functions/dot.fish

# starship
starship init fish | source

switch (uname)
    case Darwin
        source (dirname (status --current-filename))/config-osx.fish
        source (dirname (status --current-filename))/scripts/aichat_integration.fish
    case Linux
        source (dirname (status --current-filename))/config-linux.fish
    case '*'
        source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f $LOCAL_CONFIG
    source $LOCAL_CONFIG
end
set -gx GPG_TTY (tty)
