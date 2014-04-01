# path for homebrew
export PATH=/usr/local/bin:$PATH

# Load RVM into a shell session *as a function*
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

# Make Sublime my default editor
export EDITOR='subl -w'

# Aliases
alias ls='ls -lap'




## PROMPT BUSINESS ##
# Let's sprinkle a little RVM and Git in there

# System-wide .bashrc file for interactive bash(1) shells.
if [ -z "$PS1" ]; then
 return
fi

PS1='\h:\W \u\$ '
# Make bash check its window size after a process completes
shopt -s checkwinsize

# Configure colors, if available.
if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
  c_reset='\[\e[0m\]'
  c_user='\[\033[1;33m\]'
  c_path='\[\e[0;33m\]'
  c_git_clean='\[\e[0;36m\]'
  c_git_dirty='\[\e[0;35m\]'
else
  c_reset=
  c_user=
  c_path=
  c_git_clean=
  c_git_dirty=
fi

# Function to assemble the Git part of our prompt.
git_prompt () {
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi

  git_branch=$(git branch 2>/dev/null| sed -n '/^\*/s/^\* //p')

  if git diff --quiet 2>/dev/null >&2; then
    git_color="$c_git_clean"
  else
    git_color="$c_git_dirty"
  fi

  echo " [$git_color$git_branch${c_reset}]"
}

function rvm_version {
	local gemset=$(echo $GEM_HOME | awk -F'@' '{print $2}')
	[ "$gemset" != "" ] && gemset="@$gemset"
	local version=$(echo $MY_RUBY_HOME | awk -F'-' '{print $2}')
	[ "$version" != "" ] && version=" $version"
	local full="$version$gemset"
	[ "$full" != "" ] && echo "$full "
}

# Thy holy prompt.
PROMPT_COMMAND='PS1="${c_path}\w${c_reset}$(git_prompt) $(rvm_version)\$ "'

## END PROMPT BUSINESS ##

# Autocomplete for Git
# run 'curl https://raw.github.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash' to get the bash
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi