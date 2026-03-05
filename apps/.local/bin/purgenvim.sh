#!/bin/bash

clear

echo "WARNING-WARNING-WARNING-WARNING"
echo "This script will purge nvim..."
echo "YOU HAVE BEEN WARNED!!"
read -p "Continue? (y/n) " ans

# echo $ans

if [[ $ans == "y" ]]
then
  echo "Purging..."
  rm -rf ~/.config/nvim
  rm -rf ~/.local/state/nvim
  rm -rf ~/.local/share/nvim
else
  echo "Good Call!"
fi
