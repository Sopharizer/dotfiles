autoload -Uz promptinit compinit;
promptinit;
compinit;

ZPLUGIN_HOME=$HOME/.zinit
if [[ ! -f $ZPLUGIN_HOME/bin/zinit.zsh ]]; then
    git clone https://github.com/zdharma/zinit $ZPLUGIN_HOME/bin
fi
source $ZPLUGIN_HOME/bin/zinit.zsh
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

case ${OSTYPE} in
  darwin*)
    # Mac Setting
    eval $(/opt/homebrew/bin/brew shellenv)
    alias mudt="sudo tlmgr update --self --all && brew update && brew upgrade && brew cleanup && rustup update && asdf plugin update --all && asdf update && asdf reshim"
    alias balLock="osascript /Applications/balanceLock.scpt"
    ;;
  linux*)
    # LinuxBrew
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
    ;;
esac

case $(uname -a) in
  *arch*)
      alias mudt="yay -Syyu && brew update && brew upgrade && brew cleanup && rustup update && asdf update && asdf plugin update --all && asdf reshim"
      alias pbcopy='xsel --clipboard --input'
      alias pbpaste='xsel --clipboard --output'
      alias sc='setxkbmap -option -print "ctrl:swapcaps"'
      ;;
  *microsoft-standard*)
      alias mudt="sudo apt full-upgrade && sudo apt autoremove && brew upgrade && brew cleanup && rustup update && anyenv update"
      ;;
esac
# hub
eval "$(hub alias -s)"
# Starship
eval "$(starship init zsh)"


# plugins
zinit snippet 'OMZ::plugins/git/git.plugin.zsh'
zinit snippet 'OMZ::lib/clipboard.zsh'
zinit snippet 'OMZ::lib/completion.zsh'
zinit snippet 'OMZ::lib/compfix.zsh'

zinit light 'zsh-users/zsh-autosuggestions'
zinit light 'zsh-users/zsh-completions'
zinit light 'zdharma/fast-syntax-highlighting'
zinit light 'chrissicool/zsh-256color'
zinit light 'paulirish/git-open'
zinit light 'reegnz/jq-zsh-plugin'
zinit light 'b4b4r07/emoji-cli'
zinit light 'mollifier/anyframe'
zinit light 'b4b4r07/enhancd'
zinit light 'b4b4r07/zsh-vimode-visual'

zinit load 'junegunn/fzf-bin'
zinit load 'zdharma/history-search-multi-word'

zinit ice as"program" cp"httpstat.sh -> httpstat" pick"httpstat"
zinit light b4b4r07/httpstat

function peco-src () {
  local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-src
bindkey '^]' peco-src

[ -f ~/.fzf.zsh ] && source ${HOME}/.fzf.zsh

# vi-shell
bindkey -M viins 'jj' vi-cmd-mode
bindkey -M vicmd 'V'  vi-vlines-mode
bindkey -M vicmd 'v'  vi-visual-mode
bindkey -M vivis ' '  vi-visual-forward-char
bindkey -M vivis ','  vi-visual-rev-repeat-find
bindkey -M vivis '0'  vi-visual-bol
bindkey -M vivis ';'  vi-visual-repeat-find
bindkey -M vivis 'B'  vi-visual-backward-blank-word
bindkey -M vivis 'C'  vi-visual-substitute-lines
bindkey -M vivis 'D'  vi-visual-kill-and-vicmd
bindkey -M vivis 'E'  vi-visual-forward-blank-word-end
bindkey -M vivis 'F'  vi-visual-find-prev-char
bindkey -M vivis 'G'  vi-visual-goto-line
bindkey -M vivis 'I'  vi-visual-insert-bol
bindkey -M vivis 'J'  vi-visual-join
bindkey -M vivis 'O'  vi-visual-exchange-points
bindkey -M vivis 'R'  vi-visual-substitute-lines
bindkey -M vivis 'S ' vi-visual-surround-space
bindkey -M vivis "S'" vi-visual-surround-squote
bindkey -M vivis 'S"' vi-visual-surround-dquote
bindkey -M vivis 'S(' vi-visual-surround-parenthesis
bindkey -M vivis 'S)' vi-visual-surround-parenthesis
bindkey -M vivis 'T'  vi-visual-find-prev-char-skip
bindkey -M vivis 'U'  vi-visual-uppercase-region
bindkey -M vivis 'V'  vi-visual-exit-to-vlines
bindkey -M vivis 'W'  vi-visual-forward-blank-word
bindkey -M vivis 'Y'  vi-visual-yank
bindkey -M vivis '^M' vi-visual-yank
bindkey -M vivis '^[' vi-visual-exit
bindkey -M vivis 'b'  vi-visual-backward-word
bindkey -M vivis 'c'  vi-visual-change
bindkey -M vivis 'd'  vi-visual-kill-and-vicmd
bindkey -M vivis 'e'  vi-visual-forward-word-end
bindkey -M vivis 'f'  vi-visual-find-next-char
bindkey -M vivis 'gg' vi-visual-goto-first-line
bindkey -M vivis 'h'  vi-visual-backward-char
bindkey -M vivis 'j'  vi-visual-down-line
bindkey -M vivis 'jj' vi-visual-exit
bindkey -M vivis 'k'  vi-visual-up-line
bindkey -M vivis 'l'  vi-visual-forward-char
bindkey -M vivis 'o'  vi-visual-exchange-points
bindkey -M vivis 'p'  vi-visual-put
bindkey -M vivis 'r'  vi-visual-replace-region
bindkey -M vivis 't'  vi-visual-find-next-char-skip
bindkey -M vivis 'u'  vi-visual-lowercase-region
bindkey -M vivis 'v'  vi-visual-eol
bindkey -M vivis 'w'  vi-visual-forward-word
bindkey -M vivis 'y'  vi-visual-yank
. $HOME/.asdf/asdf.sh

export PATH="$HOME/.poetry/bin:$PATH"
export PATH="/usr/lib/mozc:$PATH"
