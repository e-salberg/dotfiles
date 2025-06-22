# My dotfiles

I'm starting to use linux (ubuntu via WSL) more and trying out arch on old machines. Here are my config files so far :) 

I like to use the carbon fox theme with neovim but here are files to use for other tools as well
see [carbonfox extra](https://github.com/EdenEast/nightfox.nvim/tree/main/extra/carbonfox) if want to use nightfox's carbonfox theme in vaiours tools such as fish or ghostty.

## Managing dotfiles
using GNU Stow to manage symlinks for all my dotfiles.

Commands remove any symlinks and create symlinks for everything in the currnet fold excluding the contents of .stow-local-ignore
```
$ stow -D .
$ stow . 
```

## /Scripts
useful scripts to help install everything need to go from 0 to 100
