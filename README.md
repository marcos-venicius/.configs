# .CONFIGS

### Clone repository

```bash
git clone https://github.com/dev-one-company/.configs.git
```

### Install tmux

```bash
sudo apt update
sudo apt install tmux
```
### Configure tmux file

```bash
move ./files/tmux/.tmux.conf ~/
```

### Install vim-plug

```bash
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

# Coc Extensions

```
:CocInstall coc-html coc-tsserver coc-css coc-prettier coc-eslint coc-json coc-spell-checker coc-cspell-dicts coc-emmet
```

### Configure Neovim

1. Install neovim at [official website](https://neovim.io/)
2. Install vim-plug in the [Install vim-plug](#install-vim-plug) step
3. Create the configurations folder `mkdir -p ~/.config/nvim`
4. Move config files to their directories `mv ./files/nvim/* ~/.config/nvim`
5. Open neovim with `nvim +PlugInstall`
6. Then install coc extensions
  1. open neovim `nvim` 
  2. run [installation command](#coc-extensions)

<br />
<br />
<div align="center">
  <p align="center">
    <strong>DONE!</strong>
  </p>
</div>

