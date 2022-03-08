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

## Remap `Caps` & `Esc` on wnidows

1. create `swap-esc-caps.reg` file anywhere
2. put this code inside
```reg
Windows Registry Editor Version 5.00

[HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Keyboard Layout]
"Scancode Map"=hex:00,00,00,00,00,00,00,00,03,00,00,00,3a,00,01,00,01,00,3a,00,00,00,00,00
```
3. Open the start menu and search for “Regedit” (click “Yes” if any dialog appears)
4. Click on “File”
5. Click on “Import”
6. Select the file you have just saved (i.e. ‘swap-esc-caps.reg’)
7. Log out and then log back in for the changes to take effect. Sometimes a full restart is required.
8. Start using your keyboard more efficiently!

Done! now, caps is esc, and esc is caps
