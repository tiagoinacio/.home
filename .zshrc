#### Path
fpath=(/usr/local/share/zsh-completions $fpath)
export PATH=$PATH:~/Work/emsdk-portable/emscripten/1.37.22/
export PATH=$PATH:/usr/local/bin/
export PATH=$PATH:.node_modules/.bin/
export PATH=$PATH:/Applications/Xcode.app/Contents/Developer/usr/bin/
export PATH=$PATH:~/Library/Python/2.7/bin/
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
zstyle ':completion:*:*:git:*' script ~/.home/git-completion.zsh

#### VIM
bindkey -v
export KEYTIMEOUT=1
alias jtags="ctags -R src tags"

#### NPM
NPM_PACKAGES="${HOME}/.npm-packages"
PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath` command
unset MANPATH # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"

#### PS1
autoload -U promptinit compinit
promptinit
prompt pure

compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
fpath=(/usr/local/share/zsh-completions $fpath)
source ~/Work/github/zsh-users/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

#### ZSH Options
setopt menu_complete
setopt rmstarsilent # Remove warning about deleting directory

#### Chromium
export PATH=$PATH:~/Work/googlesource/chromium/tools/depot_tools

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
alias build="cd build/ && rm -rf * && cmake .. && make && ./unit-tests && make valgrind && cd .. || cd .."

alias preview="fzf --preview="cat {}" --preview-window=right:70%:wrap"

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
    dir=$(cat ~/.fzf_favorites | fzf +m) && cd "$dir"
}

#### POWERLINE
export POWERLINE_CONFIG_COMMAND=powerline-config
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#### APPS

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# [ -f ~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh ] && source ~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh


#### Git FZF
co() {
    branch=$(git branch | fzf +m) && git co origin "$branch"
}

push() {
    echo "git push origin `git rev-parse --abbrev-ref HEAD`" | pbcopy
}
