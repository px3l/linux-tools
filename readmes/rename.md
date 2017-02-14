# rename.sh

This is a batch renaming script which will loop through a directory of files and rename them to an incrementing set of numbers. eg:

`DCIM_0273.jpg, DCIM_0245.jpg, DCIM_3713.jpg` > `0001.jpg, 0002.jpg, 0003.jpg`

The script is run using:

```bash
$ bash rename.sh <SOURCE_FOLDER> <FILETYPE>
```

For example:

```bash
$ bash rename.sh ~/projects/images png
```

You can also use the following env variables in place of position arguments:

 * `PATH_TO_FILES`
 * `FILE_TYPE`

For example:

```bash
$ export PATH_TO_FILES = ~/projects/images
$ export FILE_TYPE = png
$ bash rename.sh ~/projects/images png
```