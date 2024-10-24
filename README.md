
# Introduction

I tried so many different ways to track
my dotfiles, and ended up discovering a **bare Git Repository** method.
This method does not use symlinks!

After installation, there will be physical files locally,
but still under full version control!

## Configuration with no Repository

Initialize a bare repository

```shell
git init --bare ~/.dot
```

Create a Fish function named ```dot```

```fish
function dot -w git -d "Manages dotfiles"
    git --git-dir=$HOME/.dot --work-tree=$HOME $argv
end
```

Store it in ```~/.config/fish/functions/```, and ```source ~/.config/fish/functions/dot```

To avoid accidentally adding all files in the home folder:

```shell
echo "*" > ~/.gitignore
```

Now to add files or directories you need to ```force``` the push

```shell
dot add -f .dotfile
dot add -f .config/fish/functions/public-function.fish
dot add -f .whole-directory
```

## Installing

Move your existing dotfiles (if you have one).

```shell
mv ~/.dotfiles ~/.dotfiles.backup
```

```shell
git clone --separate-git-dir=~/.dot 
https://github.com/$USERNAME/$REPOSITORY.git ~
```
