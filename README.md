<h1 align="center">dotfiles ❤ ~/</h1> My dotfiles for my PC, managed by GNU Stow.

![gif](https://thumbs.gfycat.com/AlarmingCoordinatedEarwig-max-1mb.gif)

> os: debian sid with i3-gap ([i3wm-themer](https://github.com/unix121/i3wm-themer))

## **softwares:**

#### **apps(apt):**
[requirements](requirements.txt)

#### **apps(manually):**
```bash
i3wm-themes ohmyzsh vim baidunetdisk neteasecloudmusic sogoupinyin wps qq-linux gtags 
i3lock-fancy electron-ssr qv2ray zotero gping sd docker code
```

#### **fonts:**
```bash
fonts-noto-cjk                                      #cjk
fonts-noto-color-emoji                              #emoji
fonts-firacode                                      #code font
fontawesome-free-5.0.13                             #awesome for polybar
Droid Sans Mono for Powerline Nerd Font Complete    #powerline and nerd fonts
```

#### **my docker:**
- glances

```bash
sudo docker run -d --restart="always" -p 61208-61209:61208-61209 -e GLANCES_OPT="-w" -v /home/zhangzhao/.config/glances/glances.conf:/glances/conf/glances.conf -v /var/run/docker.sock:/var/run/docker.sock:ro --pid host --name debian nicolargo/glances:latest
```

#### **GTK cursor theme and icon theme:**
```bash
sudo apt install breeze-gtk-theme breeze-cursor-theme breeze-icon-theme
lxappearance
```

#### **get latest linux fireware:**
```bash
git clone git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
```

#### **modify the background of grub2:**
```bash
/usr/share/desktop-base/futureprototype-theme/grub/grub-4x3.png
```

#### **modify the background of lightdm:**
```bash
lightdm-gtk-greeter-settings
```

#### **Chinese man page:**
```bash
/etc/manpath.config : /usr/share/man -> /usr/share/man/zh_CN
```

#### **i3gaps for default x-window-manager:**
```bash
update-alternatives --install /bin/x-window-manager x-window-manager /usr/bin/i3 20
```

#### **mark python2 for wicd:**
```bash
apt-mark hold python2.7 wicd python2.7-dev
```

#### **my crontab:**
```bash
08 24 * * * run-parts /home/zhangzhao/.local/cron/cron.daily
```

#### **add webdav address, username and passwd to davfs2:**
```bash
sudo echo "use_locks 0"  >> /etc/davfs2/davfs2.conf
sudo echo "address username passwd" >>/etc/davfs2/secrets
sudo chmod 0600 /etc/davfs2/secrets
```


## **Install**
```bash
sudo apt install stow
git clone --recursive https://github.com/gitzhangzhao/dotfiles.git $HOME
cd $HOME/dotfiles
./install
```
## **Uninstall**
```bash
cd $HOME/dotfiles
./uninstall
```

---

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

