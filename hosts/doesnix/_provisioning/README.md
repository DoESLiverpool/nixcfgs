# Usage 

See the notes below to understand why this is a bad idea.

1. Boot the NixOS installation ISO
2. Clone this repository 
3. `cd nixcfgs/hosts/fu/<machine_id>`
4. `../_provisioning/provision-disks.sh`
5. Follow step 5 of [this blog
post](https://elis.nu/blog/2019/08/encrypted-zfs-mirror-with-mirrored-boot-on-nixos/#step-5-partitioning)
to get the UUID of the disk that is labelled `boot-fallback`.

## This is a  WIP

The `_provision` directory is intended to hold scripts that are pertinent to the
installation of the hosts. This is an imperfect method and it is preferable to
bake a script directly into an installer image instead. 

Two examples that show this prebaking process off:

- https://github.com/cleverca22/nix-tests/blob/master/kexec/justdoit.nix
- https://github.com/a-schaefers/themelios

