# .configs

## Configure init.vim - _Windows 10_

1. create folder `nvim` at `c:\Users\user_name\AppData\Local`
2. put this file inside the folder that you have been created

## Configure .tmux.conf - _only linux_

clone project
---
```bash
git clone [https://github.com/marcos-development-business/.configs.git](https://github.com/marcos-development-business/.configs.git)
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

put the [profile.ps1](https://github.com/marcos-development-business/.configs/blob/main/profile.ps1) contents at the path containing in `$PROFILE` variable
---
