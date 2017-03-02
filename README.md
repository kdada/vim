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

