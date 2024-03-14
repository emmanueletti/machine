# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Turn off case sensitivity with tab autocomplete
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
autoload -Uz compinit && compinit

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='code'
# fi

export BUNDLER_EDITOR="code"

# Alias definitions.
# For a full list of active aliases, run `alias`.
if [ -f ~/.aliases ]; then
    source ~/.aliases
fi

# Load Git completion
zstyle ':completion:*:*:git:*' script ~/.zsh/git-completion.bash
fpath=(~/.zsh $fpath)
autoload -Uz compinit && compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [[ "$OSTYPE" == "darwin"* ]]; then

  # Zsh plugins
  source "$(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme"
  source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"

  # Ruby
  source "$(brew --prefix)/opt/chruby/share/chruby/chruby.sh"
  source "$(brew --prefix)/opt/chruby/share/chruby/auto.sh"
  chruby ruby-3.3.0
  export RUBY_YJIT_ENABLE=1

  # Rails (pg gem)
  export PKG_CONFIG_PATH="/usr/local/opt/libpq/lib/pkgconfig"

  # Node
  export PATH="$HOME/.nodenv/bin:$HOME/.nodenv/plugins/node-build/bin:$PATH"
  eval "$(nodenv init - zsh)"
  nodenv global 20.10.0

elif [[ "$OSTYPE" == "linux-gnu"* ]]; then

  # zsh plugins
  source ~/powerlevel10k/powerlevel10k.zsh-theme
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

  # chruby
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh

fi

