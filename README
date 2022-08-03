# Community made kiss hooks

## Setup

This repo provides a simple shell scripts to handle hooks simply:
```sh
git clone https://github.com/kiss-community/kiss-hooks /var/db/kiss/community-hooks
cd /var/db/kiss
mkdir hooks
cp community-hooks/main.sh hooks/

# Put in your /etc/profile or whatever
export KISS_HOOKS=/var/db/kiss/hooks/main.sh
```

## Creating hooks

Refer to https://kisslinux.org/wiki/package-manager#006 for viewing existing hook

Let's say you want to make a hook for removing zsh doc after build, so the `post-build` hook:

```sh
# Create the hook directory
mkdir /var/db/kiss/hooks/post-build

# Create the hook
cat <<EOF >/var/db/kiss/hooks/post-build/remove-zsh-doc.sh
#!/bin/sh -e

rm -fr "$3/usr/share/zsh"
EOF

# Make the hook executable
chmod +x /var/db/kiss/hooks/post-build/remove-zsh-doc.sh

# Enjoy !
```

## Activating existing hooks

Simply create the target hook dir and `ln -s` the hook

```sh
mkdir /var/db/kiss/hooks/post-build
ln -s /var/db/kiss/community-hooks/post-build/remove-bash-doc.sh /var/db/kiss/hooks/post-build/
# Done
```
