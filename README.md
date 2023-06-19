## This dotfiles repository has been deprecated and is only kept as a backup.

### My dotfiles, managed by GNU Stow

![gif](https://thumbs.gfycat.com/AlarmingCoordinatedEarwig-max-1mb.gif)

#### install
- [requirements(apt)](requirements.apt)
- [requirements(cargo)](requirements.cargo)
- [requirements(pip)](requirements.pip)
- [requirements(node)](requirements.node)

#### manual install
```bash
oh-my-zsh nvim i3lock-color betterlockscreen v2raya docker
```

#### fonts
- 霞鹜文楷 for Chinese
- sf mono for terminal
- sf pro for polybar

#### theme
- NordArc for GTK
- breeze-cursor-theme for cursor
- NordArc-Icons for icons

#### install scripts
- stow_all: stow all dotfiles, include home/ and /etc/.
- unstow_all: unstow all dotfiles, include home/ and /etc/.
- stow: stow one app at a time.
- unstow: unstow one app at a time.

---

#### **docker records:**

1. glances
```bash
sudo docker run -d \
         --restart=always \
         -p 61208-61209:61208-61209 \
         -e GLANCES_OPT="-w" \
         -v /home/zhangzhao/.config/glances/glances.conf:/glances/conf/glances.conf \
         -v /var/run/docker.sock:/var/run/docker.sock:ro \
         --pid host \
         --name debian \
         nicolargo/glances:latest
```

2. v2raya
```bash
sudo docker run -d \
        --restart=always \
        --privileged \
        --network=host \
        --name v2raya \
        -v /lib/modules:/lib/modules \
        -v /etc/resolv.conf:/etc/resolv.conf \
        -v /etc/v2raya:/etc/v2raya \
        mzz2017/v2raya
```

---

#### **Bug records**

1. plymouth failed when update initramfs

> E: plymouth failed with return 1

```bash
# plymouth depends on dejavu font.
# stow dejavu font for plymouth:
cd ~/dotfiles
stow dejavu
```

2. webdav: systemd server failed

```bash
# add webdav address, username and passwd to davfs2:
sudo echo "use_locks 0"  >> /etc/davfs2/davfs2.conf
sudo echo "address username passwd" >>/etc/davfs2/secrets
sudo chmod 0600 /etc/davfs2/secrets
```
