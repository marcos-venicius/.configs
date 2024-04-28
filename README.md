# My personal configs

### Install tmux, asdf, git, nvim and command shrink

![image](https://github.com/marcos-venicius/.configs/assets/94018427/a87ab57a-30a8-46e5-b1f0-65082c1e2241)

[download the script](./scripts/configure-dev-env.sh)

Download the file and make it executable with:

```bash
chmod u+x ./configure-dev-env.sh
```

run the script.

**Now, you should exit your current terminal session and open another one to make sure everything loads correctly.**

### Install docker easy

[download the script](./scripts/install-docker-ubuntu.sh)

Just download the file and make it executable with:

```bash
chmod u+x ./install-docker-ubuntu.sh
```

Now, run the script and **booom** you have the latest version of docker!

### Configure Flat Remix Theme

[download the script](./scripts/install-flat-remix-theme.sh)

make this executable with:

```shell
chmod u+x ./install-flat-remix-theme.sh
```

then, execute the script:

```shell
./install-flat-remix-theme.sh
```

at some moment the script will ask you for your root password (just fot install `gnome-tweaks-tool`)

after all be configured, an window of `gnome-tweaks` will be opened to you, choose your applications and icons theme and close the window and everything is done!

### Fixing workspaces behavior on ubuntu

```bash
gsettings set org.gnome.mutter workspaces-only-on-primary false
```
