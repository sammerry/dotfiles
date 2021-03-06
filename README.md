# Dotfiles

[Dotfiles Original Blog Post](https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/)
[Recommended Arch Wiki Post](https://wiki.archlinux.org/index.php/Dotfiles)

To init a new dotfiles repo
```
mkdir $HOME/.dotfiles
git init --bare $HOME/.dotfiles
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
dotfiles config --local status.showUntrackedFiles no
```

![Conky](/Pictures/screenshots/00-desktop.jpg)
![Neofetch](/Pictures/screenshots/01-powertop.jpg)

### Ignoring Tracked File Changes

Occasionally you need to skip any future changes to a file. This should do it.

```
git update-index --assume-unchanged <tracked file>
git update-index --no-assume-unchanged <tracked file>
```

## Void Build a custom live usb

The broadcom-wl-dkms and cryptsetup packages aren't included in the base voidlive image. Clone the void_live repo and run the following command after updating to point at your usb drive.

```
sudo ./mklive.sh  -r "https://alpha.de.repo.voidlinux.org/current/nonfree" -p "dialog broadcom-wl-dkms cryptsetup lvm2 void-repo-nonfree curl netcat xe tcpdump strace bind-utils xfsprogs git wget samba cifs-utils"
sudo dd bs=4M if=./void<your iso>.iso of=/dev/sdc status=progress oflag=sync
```

https://wiki.voidlinux.org/Manual_install_w/full_disk_encryption
https://wiki.voidlinux.org/Installation_on_UEFI,_via_chroot

https://wiki.archlinux.org/index.php/Git#Filtering_confidential_information

### Alsa Equalizer

The caps.so package is mising a symlink and `alsamixer -D equal` wont work without it. After installing alsa plugins run the following.
```
 sudo ln -s /usr/lib/ladspa/caps.so /usr/lib/caps.so
```
