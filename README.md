Pwnix
==
A security-focused Linux distribution built on top of
[NixOS](https://nixos.org/).

# Purpose #
Although many security/pentesting Linux distributions exist out there,
which work quit amazing, they do tend to have certain issues. Many of
these issues are thankfully solved by functional package managers, and
this repo simply exists to bridge the gap.

## Compared to other operating systems ##

### Unneeded Bloat ###
Other images and virtual machines tend to be unnecessarily
large. There are bootstrapping programs for them, but they're hard to
use and there's not that much documentation on them. With Nix, building
a custom machine is a matter of executing a one-liner command.

### Rolling release ###
Most, if not all, pentesting distributions tend to be rolling release,
which is usually necessary. The downside to this is that if you
download, say a Kali image, in a day or two, when you plug in your
bootstick in a machine you would have to wait a long time to get the
recent packages. When you have control over your customized OS, you
can build it whenever you leave the house.

### Semi-decentralized ###
The Nix package repository (called nixpkgs) is just a git repo. This
means that (unlike Kali, Parrot, and BlackArch, but similar to Pentoo)
if the Debian or Arch package repositories go down or are not
accessible, you can't dowload packages. With Nix, you'd only come
across this if GitHub goes down. Unlike Gentoo, Nix can download
binaries, but if they're not available it builds the package from
source. <!-- TODO: Reference transparent binary distribution -->


# Build #
To build, you need the new [flakes](https://nixos.wiki/wiki/Flakes)
feature of Nix.

## ISO ##

### Build ###
To build the ISO image, simply run

``` shell
nix build ".#iso" -o iso
```

### Write to USB ###
To make a bootable usb drive, run
``` shell
sudo dd if=./iso/iso/nixos.iso of=$your_device conv=fdatasync status=progress
```
where `$your_device` is your USB device (usually looks like `/dev/sdX`).
**NOTE:** Make sure you input the device name correctly. Simple typos
can lead to your main harddisk being overwritten.

## VM ##
TODO...
