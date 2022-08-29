# .configs

## Configure init.vim - _Windows 10_

1. create folder `nvim` at `c:\Users\user_name\AppData\Local`
2. put this file inside the folder that you have been created

## Configure .tmux.conf - _only linux_

clone project
---
```bash
git clone https://github.com/dev-one-company/.configs.git
```

install tmux
---
```bash
sudo apt update
sudo apt install tmux
```

move .tmux.conf file
---
```bash
move .tmux.conf ~/
```

## Configure profile.ps1 - _Windows 10_

see profile path
---
```ps1
echo $PROFILE
```

put the [profile.ps1](https://github.com/dev-one-company/.configs/blob/main/profile.ps1) contents at the path containing in `$PROFILE` variable
---

# Install vim-plug

## Windows

> [here](https://github.com/junegunn/vim-plug) is the official repository

---
neovim on windows

```ps1
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`
    ni "$(@($env:XDG_DATA_HOME, $env:LOCALAPPDATA)[$null -eq $env:XDG_DATA_HOME])/nvim-data/site/autoload/plug.vim" -Force
```

# Coc Extensions

```
:CocInstall coc-html coc-tsserver coc-css coc-prettier coc-eslint coc-json coc-docker coc-spell-checker coc-cspell-dicts coc-omnisharp
```

## Install Omnisharp dependencies

```bash
dotnet tool install --global csharp-ls
```
