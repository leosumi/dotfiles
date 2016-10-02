#! /bin/bash

DOTFILES_DIR=$HOME/.dotfiles

echo "Creating symlinks"
echo "-----------------"

while read link ; do
  # skip empty lines
  [ -z "$link" ] && continue
  # lines with # are comment
  [[ "$link" =~ ^#.*$ ]] && continue

  # evaluate the link
  link="$(eval echo $link)"

  src="$(echo $link | cut -d " " -f 1)"
  target="$(echo $link | cut -d " " -f 2)"

  # Destroy old symbolic link
  if [ -L $target ]; then
    echo "remove old symlink for $target"
    rm $target
  fi

  # do not destroy old config files
  if [ -f $target ]; then
    echo "saving old $target"
    mv $target "$target".old
  fi

  # create symlink
  echo "creating symlink for $src"
  ln -s $src $target

  echo ""
done < links.list

