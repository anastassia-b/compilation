#!/bin/bash

if [ $(whoami) == "root" ]; then
  echo "You're root!"
else
  echo "Your username is $(whoami)"
  echo "Your home-directory is $HOME"
  echo "Your current directory is $PWD"
  echo "Your computer's host-name is $HOSTNAME"
fi
