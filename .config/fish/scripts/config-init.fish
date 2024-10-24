#!/usr/bin/env fish

# Clone bare repository
git clone --bare git@https://github.com/PedroTChang/dot.git $HOME/.dot

# Define config function
function config
    git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME $argv
end

# Create backup directory
mkdir -p .dotfiles-backup

# Try to checkout
config checkout
if test $status -eq 0
    echo "Checked out dotfiles from git@https://github.com/PedroTChang/dot.git"
else
    echo "Moving existing dotfiles to ~/.dotfiles-backup"
    # In Fish, we need to modify the pipeline slightly
    config checkout 2>&1 | string match -r "\s+\." | string split \n | while read -l file
        set cleaned_file (string trim $file)
        mv $cleaned_file .dotfiles-backup/$cleaned_file
    end
end

# Final configuration
config checkout
config config status.showUntrackedFiles no
