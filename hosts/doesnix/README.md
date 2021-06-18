# doesnix

![image](https://user-images.githubusercontent.com/26458780/122496094-1c0be700-cfe3-11eb-8c45-508b08f8cd79.png)

## What is it?
**doesnix** is a machine that currently implements a Samba share called `does-samba` at `10.0.100.3`. Those two facts can be seen by the [configuration.nix](./doesnix/configuration.nix). In a way, this is self-documenting.

- This machine runs ZFS in a mirrored array of the hard drives that can clearly be seen in the above image.

    ```
    [root@doesnix:/etc/nixos]# zpool status
      pool: zroot
     state: ONLINE
    config:
 
        NAME                                                STATE     READ WRITE CKSUM
        zroot                                               ONLINE       0     0     0
         mirror-0                                          ONLINE       0     0     0
           ata-ST1000DM003-1CH162_Z1D830P6-part1           ONLINE       0     0     0
           ata-WDC_WD10EZEX-00KUWA0_WD-WCC1S6899069-part1  ONLINE       0     0     0
 
    errors: No known data errors
    ```
- This machine may do a lot more in the future.

## Specs?
The hardware configuration for the machine is kept up to date in [hwinfo](./doesnix/metadata/hwinfo)

## Why?

See the following issue https://github.com/DoESLiverpool/somebody-should/issues/1580
