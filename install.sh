#!/usr/bin/env bash

# start by installing zsh, oh-my-zsh, and related themes, etc.


# install zsh
install_zsh () {
# Test to see if zsh is installed.  If it is:
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
  # Set the default shell to zsh if it isn't currently set to zsh
  if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
      chsh -s $(which zsh)
  fi
else
  sudo apt install zsh
  install_zsh
fi
}
install_zsh


# install oh-my-zsh
cd ~
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended


# install PowerLevel10K theme:
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k


# now let's customize our config files

# make sure we're in the directory of this file
cd "$(dirname "${BASH_SOURCE}")";

# pull down the latest version of this repo
git pull origin master;

# function to sync the files from the repo to the home directory
function syncFiles() {
	rsync --exclude ".git/" \
		--exclude "bootstrap.sh" \
		--exclude "README.md" \
		--exclude "LICENSE-MIT.txt" \
		-avh --no-perms . ~;
	source ~/.zshrc;
}

# warn user about possibly overwriting existing files unless they used the force flag
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	syncFiles;
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
	echo "";
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		syncFiles;
	fi;
fi;

unset syncFiles;
