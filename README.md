<h1 align="center">dotfiles ❤ ~/</h1> My dotfiles for my PC, managed by GNU Stow.

![gif](https://thumbs.gfycat.com/AlarmingCoordinatedEarwig-max-1mb.gif)

> os: debian sid with i3-gap ([i3wm-themer](https://github.com/unix121/i3wm-themer))

## **Requirments:**

#### **package(apt):**
[requirements](requirements.txt)

#### **other software(manually):**
```bash
i3wm-themes ohmyzsh vim baidunetdisk neteasecloudmusic sogoupinyin wps qq-linux gtags 
i3lock-fancy electron-ssr qv2ray zotero gping sd docker code
```

#### **my fonts:**
- fonts-noto-cjk                                      #cjk
- fonts-noto-color-emoji                              #emoji
- fonts-firacode                                      #code font
- fontawesome-free-5.0.13                             #awesome for polybar
- Droid Sans Mono for Powerline Nerd Font Complete    #powerline and nerd fonts

#### **my GTK theme, cursor theme and icon theme:**
- breeze-gtk-theme 
- breeze-cursor-theme 
- breeze-icon-theme

## **Installation**
need stow first.
```bash
sudo apt install stow
```
clone the repository
```bash
git clone --recursive https://github.com/gitzhangzhao/dotfiles.git $HOME
cd $HOME/dotfiles
```
there are four scripts can be used:

- install: install all dotfiles, include home/ and /etc/.
- uninstall: uninstall all dotfiles, include home/ and /etc/.
- stow: stow one app at a time.
- unstow: unstow one app at a time.

---------------------------------------------------------------

## **docker records:**
### 1. glances

```bash
sudo docker run -d --restart="always" -p 61208-61209:61208-61209 -e GLANCES_OPT="-w" -v /home/zhangzhao/.config/glances/glances.conf:/glances/conf/glances.conf -v /var/run/docker.sock:/var/run/docker.sock:ro --pid host --name debian nicolargo/glances:latest
```

---------------------------------------------------------------

## **Bug records**

### 1. plymouth failed when update initramfs

> E: plymouth failed with return 1

```bash
# plymouth depends dejavu font, but you don't have to install it,
# just reinstall plymouth (apt reinstall is useless).
sudo apt purge plymouth
reboot
sudo apt install plymouth
```

### 2. webdav: systemd server failed

```bash
# add webdav address, username and passwd to davfs2:
sudo echo "use_locks 0"  >> /etc/davfs2/davfs2.conf
sudo echo "address username passwd" >>/etc/davfs2/secrets
sudo chmod 0600 /etc/davfs2/secrets
```

