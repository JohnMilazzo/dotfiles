#!/bin/bash

### variables
dfdir=~/dotfiles                       # dotfiles directory
budfdir=~/dotfiles_old                 # backup dotfiles directory
fileslist="gitconfig p10k.zsh zshrc"   # list of files to sync to home directory


# create backup directory
echo "Creating backup dotfiles directory in ~ ..."
mkdir -p $budfdir
echo "Done."


# change to the dotfiles directory
echo "Changing to the dotfiles directory..."
cd $dfdir
echo "Done."


# move any existing dotfiles from the home directory to the backup
for file in $fileslist; do
  echo "Backing up existing dotfiles..."
  mv ~/.$file ~/dotfiles_old
  echo "Symlinking the new files..."
  ln -s $dfdir/$file ~/.$file
done

echo "Done."
