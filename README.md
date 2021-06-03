<h1 align="center">dotfiles ❤ ~/</h1> My dotfiles for my debian PC, managed by GNU Stow.

> debian sid with i3-gap ([i3wm-themer](https://github.com/unix121/i3wm-themer))

```bash
       _,met$$$$$$$$gg.          zhangzhao@debian
    ,g$$$$$$$$$$$$$$$$$$P.       ----------------
  ,g$$P"            """Y$$.".    OS: Debian GNU/Linux 11 (sid)
 ,$$P'                  `$$$.    Host: Inspiron 5537
',$$P          ,ggs.     `$$b:   Kernel: 5.10.0-7-amd64
`d$$'        ,$P"'   .    $$$    Uptime: 14 hours
 $$P         d$'     ,    $$P    Packages: 1388 (dpkg)
 $$:         $$.   -    ,d$$'    Shell: zsh 5.8
 $$;         Y$b._    _,d$P'     Resolution: 1920x1080
 Y$$.       `.`"Y$$$$P"'         DE: lightdm-xsession
 `$$b         "-.__              WM: i3
  `Y$$                           Theme: Breeze-Dark [GTK2/3]
   `Y$$.                         Icons: Adwaita [GTK2/3]
     `$$b.                       Terminal: qterminal
       `Y$$b.                    Terminal Font: Fira Code 13
          `"Y$b._                CPU: Intel i5-4200U (4) @ 2.60
              `"""               GPU: Intel Haswell-ULT
                                 GPU: AMD ATI Radeon HD 
                                 Memory: 761MiB / 7844MiB
```

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

## **Bugs record**

### 1. plymouth failed when update initramfs

> E: plymouth failed with return 1

```bash
# 'plymouth depends dejavu font, but you don't have to install it.'
# just reinstall plymouth like this:
sudo apt purge plymouth
reboot
sudo apt install plymouth
# apt reinstall is useless.
```

