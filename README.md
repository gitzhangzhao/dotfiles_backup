<h1 align="center">dotfiles ❤ ~/</h1>

> My dotfiles for my debian PC, managed by GNU Stow.
> debian sid with i3-gap ([i3wm-themer](https://github.com/unix121/i3wm-themer))

## **softwares:**

#### **apps(apt):**
```bash
xserver-xorg zsh trash qterminal fcitx goldendict axel vlc exa bat wicd lightdm lightdm-gtk-greeter-settings pulseaudio pavucontrol Firefox ripgrep zip unzip rar unrar tldr locate fd-find zsh wget universal-ctags xautolock clang nomacs redshift translate-shell speedcrunch pylint shellcheck smartmontools sudo flameshot progress sshfs ncdu wireshark cflow lxappearance ufw xserver-xorg-input-synaptics dos2unix strace ltrace samba mpv lshw fzf hexyl davfs remmina iotop neofetch picom pandoc graphviz feh zathura unclutter
```

#### **apps(manually):**
```bash
i3wm-themes ohmyzsh vim baidunetdisk neteasecloudmusic sogoupinyin wps qq-linux gtags i3lock-fancy electron-ssr qv2ray zotero gping sd docker code
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
sudo apt install breeze-gtk-theme breeze-cursor-theme
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
/etc/manpath.config -> /usr/share/man -> /usr/share/man/zh_CN
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

## **Install**
```bash
sudo apt install stow
git clone https://github.com/gitzhangzhao/dotfiles.git $HOME
cd $HOME/dotfiles
./install
```
## **Uninstall**
```bash
cd $HOME/dotfiles
./uninstall
```
