export ZSH="~/.oh-my-zsh"

ZSH_THEME="refined"


# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
#COMPLETION_WAITING_DOTS="true"
# testing

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

PATH=$PATH:~/.local/bin/:~/.config/scripts:~/.emacs.d/bin:~/.config/rofi/bin



# TO fix some prompt error
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
#export TERM=xst-256color # This is shit

export EDITOR='nvim'
export XDG_CONFIG_HOME="/home/$USER/.config"
export XDG_DATA_HOME="$HOME/.local/share"
# Fix for Wxgui apps
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib

# my alias
alias clip=' xclip -selection clipboard' # copies to clipboard
alias neovim="TERM=xterm-265color nvim " # alacritty was giving trouble

alias gitgr="git log --all --color --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%C(bold blue) <%an> %Creset' --abbrev-commit"
alias testgitgr="git log --all --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold cyan)%aD%C(reset) %C(bold green)(%ar)%C(reset) %C(bold cyan)(committed: %cD)%C(reset) %C(auto)%d%C(reset)%n''          %C(white)%s%C(reset)%n''          %C(dim white)- %an <%ae> %C(reset) %C(dim white)(committer: %cn <%ce>)%C(reset)'"        
alias vim="TERM=xterm-256color vim "
alias bottom="btm --color nord -S  --battery -m -l  --show_table_scroll_position -T"


# Some other alias
alias vivaldi-safe="firejail --private=~/test/sandbox/ --noprofile vivaldi-snapshot"

# Safe
alias rm="rm -i -v"
alias mv="mv -i -v"
alias cp="cp -r -v"


# Wal stuff
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh
