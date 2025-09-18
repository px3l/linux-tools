# rename.sh

A simple batch renaming script that renames files with a specific extension to an incrementing set of numbers with zero-padding.

## Usage

```bash
./rename.sh <directory> <file_extension>
```

## Examples

```bash
# Rename all jpg files in ~/photos
./rename.sh ~/photos jpg

# Rename all png files in current directory
./rename.sh . png
```

## Environment Variables

You can also use environment variables:

```bash
PATH_TO_FILES=~/photos FILE_TYPE=jpg ./rename.sh
```

## What it does

1. Takes all files with the specified extension in the directory
2. Renames them to 0001.ext, 0002.ext, 0003.ext, etc.
3. Skips files if the target name already exists
4. Shows what it's renaming as it goes

## Example

```bash
# Input files:
# IMG_001.jpg, IMG_002.jpg, IMG_003.jpg

# Output:
# 0001.jpg, 0002.jpg, 0003.jpg
```