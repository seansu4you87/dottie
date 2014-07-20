#!/bin/bash

set -e

function abs_path() {
  echo $(perl -MCwd=abs_path -le 'print abs_path($ARGV[0])' $1)
}

function link_files_from_dir() {
  dir=${1:?"dir not given"}
  prefix=${2:?"prefix not given"}
  this_dir=$(abs_path $(dirname $0))
  for source in $(find $this_dir/$dir -type f; find $this_dir/$dir -type l); do
    target=$HOME/$prefix${source##$this_dir/$dir/}
    if [ ! -e $target ]; then
      if [[ "$target" != */.git/* ]]; then
        rm -f $target
        echo "Linking $target"
        mkdir -p $(dirname $target)
        ln -s $source $target
      fi
    elif [ ! -L "$target" ] || [ "$source" != "$(readlink $target)" ]; then
      echo "Skipping $target. Remove to symlink to the dottie version."
    fi
  done
}

function copy_files_from_dir() {
  dir=${1:?"dir not given"}
  prefix=${2:?"prefix not given"}
  this_dir=$(abs_path $(dirname $0))
  for source in $(find $this_dir/$dir -type f; find $this_dir/$dir -type l); do
    target=$HOME/$prefix${source##$this_dir/$dir/}
    if [ ! -e $target ]; then
      if [[ "$target" != */.git/* ]]; then
        rm -f $target
        echo "Copying $target"
        mkdir -p $(dirname $target)
        cp $source $target
      fi
    else
      echo "Skipping $target. Remove to start with a 'fresh' copy to customize."
    fi
  done
}
brew_install() {
  formula=$1
  if [ ! -d $(brew --prefix "$formula") ]; then
    brew install "$formula"
  fi
}

# these are both required for git tab-completion to work
brew_install bash-completion
brew_install git
brew_install ack

brew_install python
pip install https://github.com/Lokaltog/powerline/tarball/develop
POWERLINE_PATH="$HOME/Library/Python/2.7/lib/python/site-packages/powerline"
export POWERLINE_PATH

link_files_from_dir "dots" "."
copy_files_from_dir "copied_dots" "."
link_files_from_dir "bin" "bin/"

echo "All done!"
