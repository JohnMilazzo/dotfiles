# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin directories
PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# JM - 2018.07.18
# add path so eslint in windows vscode can use wsl's node/npm
# there's also a setting in vscode to reference eslint.nodePath
# this solution was found @ https://stackoverflow.com/questions/48370865/eslint-on-vscode-using-wsl
# this will need to be updated any time we add a new version of node to nvm
PATH="$HOME/.nvm/versions/node/v10.6.0/bin:$PATH"
