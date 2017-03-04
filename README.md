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
set -g status off
set-option -g default-command "reattach-to-user-namespace -l zsh"
unbind C-b
set -g prefix C-n
bind C-n send-prefix
set-window-option -g mode-keys vi
bind C-n copy-mode
bind C-p paste-buffer
bind | split-window -h
bind - split-window -v
bind h select-pane -L
bind j select-pane -D
bind k select-pane -U
bind l select-pane -R
bind-key -t vi-copy 'v' begin-selection
bind-key -t vi-copy 'y' copy-pipe "reattach-to-user-namespace pbcopy"
set -g mouse on
```

Start tmux when zsh launched.  
Append to the end of ~/.zshrc
```
# Start tmux when start zsh
if [ "$TMUX" = "" ]; then tmux; fi
```
