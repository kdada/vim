# vim script

### Update repo
```
$ git submodule update --init --recursive
```

### Build plugins

(1) Build YouCompleteMe
```
$ cd pack/common/start/YouCompleteMe
$ ./install.py --gocode-completer
```

(2) Set gocode uses unimported packages
```
gocode set unimported-packages true
```

(3) Create vim backup, swap, undo directory
```
mkdir -p ~/.vim_files/{backup,swap,undo}
```

### Install zsh
```
brew install zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
")"
```

### Install tmux

```
brew install tmux
brew install reattach-to-user-namespace
```

Create ~/.tmux.conf
```
set-option -g default-shell /usr/bin/zsh
set -g status off
unbind C-b
set -g prefix C-n
bind C-n send-prefix
set-window-option -g mode-keys vi
bind C-n copy-mode
bind C-p paste-buffer
bind \ split-window -h -c '#{pane_current_path}'
bind - split-window -v -c '#{pane_current_path}'
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
bind H resize-pane -L 10
bind J resize-pane -D 10
bind K resize-pane -U 10
bind L resize-pane -R 10
bind-key -t vi-copy 'v' begin-selection
bind-key -t vi-copy y copy-pipe "tmux save-buffer - | xclip -sel clipboard -i"
set -g mouse on
```

Start tmux when zsh launched.  
Append to the end of ~/.zshrc
```
# need install vimx
alias vi='vimx'
alias vim='vimx'

# Start tmux when start zsh
if [ "$TMUX" = "" ]; then tmux; fi
```
