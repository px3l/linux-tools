# cloneallrepos.sh

CURRENTLY UNTESTED!!

This script will clone all github repos for a user. Designed for git cloning all my personal repos should I reformat or get a new PC.

USER is required, but PAGE will default to 1 if it isn't entered. Each page has to be cloned separately. Repos per page is set to 100 which is the maximum, so each page on github will be cloned in full.

## Usage

The script is run using:

```bash
$ bash cloneallrepos.sh <USER> <PAGE>
```

For example:

```bash
$ bash cloneallrepos.sh px3l 2
```
