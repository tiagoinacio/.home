#### Path
fpath=(/usr/local/share/zsh-completions $fpath)
export PATH=$PATH:/usr/local/bin/
export PATH=$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin/
zstyle ':completion:*:*:git:*' script ~/.home/git-completion.zsh

#### VIM
bindkey -v
export KEYTIMEOUT=1

#### NPM
NPM_PACKAGES="${HOME}/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

#### PS1
autoload -U promptinit; promptinit
autoload -U compinit && compinit
prompt pure

#### ZSH Options
setopt menu_complete
setopt rmstarsilent # Remove warning about deleting directory


#### Alias
alias ..="cd .."
alias run="npm run"
alias src="source ~/.zshrc"
alias l="clear"
alias cdv="cd ~/.vim"
alias cdw="cd ~/Work"
alias cdt="cd ~/tmp"
alias ls="ls -Gplah"
alias g="git"
alias gc="git commit -m"
alias vi="vim"
alias mvim="/Applications/MacVim.app/Contents/MacOS/MacVim"

favorites() {
    echo "" > ~/.fzf_favorites
    echo "(" > ~/.emacs.d/projectile-bookmarks.eld
    echo "/usr/local/etc/nginx/" >> ~/.fzf_favorites
    echo "\"/usr/local/etc/nginx/\"" >> ~/.emacs.d/projectile-bookmarks.eld

    _home=`find ~ -type d -maxdepth 1 -name ".*"`;
    for i in $_home; do
        echo $i >> ~/.fzf_favorites
        echo "\"$i\"" >> ~/.emacs.d/projectile-bookmarks.eld
    done

    _work=`find ~/Work -type d -maxdepth 3`;
    for i in $_work; do
        echo $i >> ~/.fzf_favorites
        echo "\"$i\"" >> ~/.emacs.d/projectile-bookmarks.eld
    done
    echo ")" >> ~/.emacs.d/projectile-bookmarks.eld
}

c() {
    local dir
    dir=$(cat /Users/tiago.inacio/.fzf_favorites | fzf +m) && cd "$dir"
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
