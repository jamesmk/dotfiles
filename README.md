# Dotfiles

…for the masses, or maybe just myself.

## OS X Settings

Show hidden files in Finder  

	$ defaults write com.apple.Finder AppleShowAllFiles YES

## Apps

### Sublime Text 2

* Install: http://www.sublimetext.com
* Copy over user settings and keymap
* Install Package Control: http://wbond.net/sublime_packages/package_control/installation
* Copy over Package Control settings
* Restart and packages will install
* Copy over package specific settings

## Downloads

Grab Git Autocomplete from Git's OS clone:  
https://github.com/git/git/blob/master/contrib/completion/git-completion.bash

	$ curl https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash