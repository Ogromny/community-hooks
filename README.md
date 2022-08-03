# Community made kiss hooks

![image](https://user-images.githubusercontent.com/10464831/182607138-1669d6c8-bfb7-4e89-885e-d419bd9a580e.png)

## Setup

```sh
YOUR_KISS_BASE_PATH=/var/db/kiss

git clone https://github.com/kiss-community/kiss-hooks $YOUR_KISS_BASE_PATH/community-hooks
cd $YOUR_KISS_BASE_PATH
mkdir hooks
ln -s community-hooks/main.sh hooks/

# Put in your /etc/profile or whatever
YOUR_KISS_BASE_PATH=/var/db/kiss
export KISS_HOOKS=$YOUR_KISS_BASE_PATH/hooks/main.sh
```

## Creating hooks

Refer to https://kisslinux.org/wiki/package-manager#006 for viewing existing hook

Let's say you want to make a hook for removing zsh doc after build, so the `post-build` hook:

```sh
# Create the hook directory
mkdir $YOUR_KISS_BASE_PATH/hooks/post-build

# Create the hook
cat <<EOF >$YOUR_KISS_BASE_PATH/hooks/post-build/remove-zsh-doc.sh
#!/bin/sh -e

rm -fr "$3/usr/share/zsh"
EOF

# Make the hook executable
chmod +x $YOUR_KISS_BASE_PATH/hooks/post-build/remove-zsh-doc.sh

# Enjoy !
```

## Activating existing hooks

Simply create the target hook dir and `ln -s` the hook

```sh
mkdir $YOUR_KISS_BASE_PATH/hooks/post-build
ln -s $YOUR_KISS_BASE_PATH/community-hooks/post-build/remove-bash-doc.sh $YOUR_KISS_BASE_PATH/hooks/post-build/
# Done
```

