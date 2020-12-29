# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"

# # # # # # # # # # #
# # # VARIABLES # # #
# # # # # # # # # # #
# Add local sbin to $PATH.
export PATH="/usr/local/sbin:${PATH}"
# Path to the oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"
export CONFIG="${HOME}/.config/userConfig"
# ls colors
export LS_COLORS=`cat ${HOME}/.config/zshrc/LS_COLORS`
# export LS_COLORS="cat ${CONFIG}/zshrc/LS_COLORS"

# Use case-sensitive completion.
CASE_SENSITIVE="false"

# Define how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Enable command auto-correction.
ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Configure history stamp format
HIST_STAMPS="yyyy-mm-dd"


# # # # # # # # # #
# # # PLUGINS # # #
# # # # # # # # # #
# Plugin configuration
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  colored-man-pages
  colorize
  docker
  git
  zsh-autosuggestions
  zsh-completions
)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

# history
source $HOME/.oh-my-zsh/custom/plugins/zsh-histdb/sqlite-history.zsh
autoload -Uz add-zsh-hook
add-zsh-hook precmd histdb-update-outcome


# completions
autoload -Uz +X compinit && compinit
autoload -Uz +X bashcompinit && bashcompinit
eval "$(stack --bash-completion-script stack)"


# # # # # # # # # # # #
# # # COMPLETIONS # # #
# # # # # # # # # # # #
source <(kubectl completion zsh)
source <(helm completion zsh)

# vault
complete -o nospace -C /usr/bin/vault vault
# azure CLI
source /etc/bash_completion.d/azure-cli

# # Load nvm
export NVM_DIR=~/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# npm
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$PATH:$NPM_PACKAGES/bin"
# dotnet
export DOTNET_ROOT=$HOME/dotnet
export PATH=$PATH:$HOME/dotnet
# poetry
export PATH=$PATH:$HOME/.poetry/bin
# kubectl plugin
export PATH=$PATH:~/.kube/plugins/jordanwilson230
# add robo3t
export PATH=$PATH:/opt/robo3t/bin/
# # Preserve MANPATH if you already defined it somewhere in your config.
# # Otherwise, fall back to `manpath` so we can inherit from `/etc/manpath`.
# export MANPATH="${MANPATH-$(manpath)}:$NPM_PACKAGES/share/man"

# # yarn path
# YARN_PATH="${HOME}/.yarn"
# export PATH="$PATH:$YARN_PATH/bin"



# Load oh-my-zsh framework
source "${ZSH}/oh-my-zsh.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# # syntax highlighting
# source "$HOME/.zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

 
# Search using CTRL+R
# this at the end otherwise CTRL+R is remapped
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# don't consider duplicates in history search
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS

# stop checking if command is correct
unsetopt correct_all
                                                                                                                              
# there is a conflict between the git plugin and the ImageMagick command gm, so using unalias
 unalias gm

# ALIASES
alias vim="${HOME}/AppImages/nvim.appimage"
alias nvim="${HOME}/AppImages/nvim.appimage"

