# diskclone.sh

CURRENTLY UNTESTED!!

This is a script which will create a complete carbon copy clone from disk 1 to disk 2 using the GNU dd command. It will clone the entire drive, including the MBR (and therefore bootloader), all partitions, UUIDs, and data.

`noerror` instructs dd to continue operation, ignoring all read errors. Default behavior for dd is to halt at any error.

`sync` fills input blocks with zeroes if there were any read errors, so data offsets stay in sync.

`bs=` sets the block size. Defaults to 64K (65536) bytes. Use a bigger value if necessary, 128K etc.

The script is run using:

```bash
$ bash diskclone.sh <DISK_1> <DISK_2> <BLOCK_SIZE>
```

For example:

```bash
$ bash diskclone.sh /dev/sda1 /dev/sdb1 131072
```
