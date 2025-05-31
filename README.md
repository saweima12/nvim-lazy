# 💤 LazyVim

A template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.

## Requirements

- Neovim 0.11+
- Ripgrep
- Fzf
- Nodejs 20+ (for LSP)
- Lazygit
- Jq

NOTE: Use `:LazyHealth` to check the dependencies

## Use it

```bash
# By HTTPS
[ -d $HOME/.config/nvim ] && mv $HOME/.config/{nvim,nvim.old}; \
    git clone https://github.com/saweima12/nvim-lazy.git $HOME/.config/nvim

# By SSH
[ -d $HOME/.config/nvim ] && mv $HOME/.config/{nvim,nvim.old}; \
    git clone git@github.com:saweima12/nvim-lazy.git $HOME/.config/nvim
```

