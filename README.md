# .CONFIGS

### Clone repository

```bash
git clone https://github.com/dev-one-company/.configs.git
```

### Vscode asdf dotnet

```bash
version=`asdf current dotnet-core | awk '{print $2}'`
export DOTNET_MSBUILD_SDK_RESOLVER_SDKS_DIR=$(echo $HOME/.asdf/installs/dotnet-core/$version/sdk/$version/Sdks)
export DOTNET_MSBUILD_SDK_RESOLVER_SDKS_VER=$version
export DOTNET_MSBUILD_SDK_RESOLVER_CLI_DIR=$(echo $HOME/.asdf/installs/dotnet-core/$version)
code .
````

this can be saved on your `.bashrc` or `.zshrc` without the `code .`

# Linux 

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

- Install neovim at [official website](https://neovim.io/)
- Install vim-plug in the [Install vim-plug](#install-vim-plug) step
- Create the configurations folder `mkdir -p ~/.config/nvim`
- Move config files to their directories `mv ./files/nvim/* ~/.config/nvim`
- Open neovim with `nvim +PlugInstall`
- Then install coc extensions
  - open neovim `nvim` 
  - run [installation command](#coc-extensions)

# Windows

### Configure powershell prompt

- open powershell (as administrator)
- update execution policy `Set-ExecutionPolicy Unrestricted`
- open prompt file with `code $PROFILE`
- paste the code from [profile.ps1](./files/windows/profile.ps1) file
- save the file and reopen powershell

<br />
<br />
<div align="center">
  <p align="center">
    <strong>DONE!</strong>
  </p>
</div>

