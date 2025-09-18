# cloneallrepos.sh

A simple script to clone all GitHub repositories for a user.

## Usage

```bash
./cloneallrepos.sh <username> [page]
```

## Examples

```bash
# Clone all repos for user 'px3l'
./cloneallrepos.sh px3l

# Clone repos from page 2
./cloneallrepos.sh px3l 2
```

## Environment Variables

You can also use environment variables:

```bash
USER=px3l PAGE=2 ./cloneallrepos.sh
```

## What it does

1. Gets a list of all repositories for the specified user from GitHub API
2. Clones each repository into the current directory
3. Shows progress as it clones each repo