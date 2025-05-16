# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
#if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; #then
#  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
#fi

# Set terminal colors and history limit (matching tmux settings)
export TERM="xterm-256color"
HISTSIZE=10000
SAVEHIST=10000

# Enable mouse support for Zsh
bindkey -M viins '\e[<0-9]*~' vi-bindings

# Path to your Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Use Powerlevel10k theme
ZSH_THEME="powerlevel10k/powerlevel10k"

# Disable Powerlevel10k configuration wizard
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# Source Powerlevel10k config if it exists
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Enable command auto-correction
ENABLE_CORRECTION="true"

# Set plugins (git is enabled)
plugins=(git)

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Set PYENV_PATH and initialize Pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

# Maven path (optional)
export PATH=$PATH:/bin/mvn

# Bun completions (if used)
[ -s "/home/ptspl09/.bun/_bun" ] && source "/home/ptspl09/.bun/_bun"

# Bun installation path
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# NVM (Node Version Manager) initialization
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Vim Tutor alias
alias vimtutor='/usr/bin/vimtutor'

if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux attach-session -t default || tmux new-session -s default
fi


# Custom Zsh configurations to replicate tmux behaviors:
# Pane navigation using M-Arrow
bindkey '^[[1;9D' backward-word   # M-Left
bindkey '^[[1;9C' forward-word    # M-Right
bindkey '^[[1;9A' up-line-or-history    # M-Up
bindkey '^[[1;9B' down-line-or-history  # M-Down

# Reload Zsh config
alias reload="source ~/.zshrc"

export JAVA_HOME=/usr/lib/jvm/java-21-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
