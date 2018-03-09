#!/usr/bin/env bash

# Install utilities

## zsh
read -p "Zsh? : (y/n)" CONDITION;

if [ "$CONDITION" == "y" ]; then
  sudo apt -y install zsh
  chsh -s $(which zsh)
fi

## dotfiles
read -p "Dotfiles? : (y/n)" CONDITION;

if [ "$CONDITION" == "y" ]; then
  ./install
fi

## curl
read -p "curl? : (y/n)" CONDITION;

if [ "$CONDITION" == "y" ]; then
  sudo apt -y install curl
fi

## git
read -p "git? : (y/n)" CONDITION;

if [ "$CONDITION" == "y" ]; then
  sudo apt -y install git
fi

## rbenv
read -p "rbenv? : (y/n)" CONDITION;

if [ "$CONDITION" == "y" ]; then
  git clone https://github.com/rbenv/rbenv.git ~/.rbenv
fi

# -----> Install Chrome <-----
read -p "Chrome? : (y/n)" CONDITION;

if [ "$CONDITION" == "y" ]; then
  wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P /tmp
  sudo dpkg -i /tmp/google-chrome*
  sudo apt-get -f install -y
  rm /tmp/google*chrome*.deb
fi

# -----> Install oh-my-zsh <-----
## https://github.com/robbyrussell/oh-my-zsh

read -p "Oh my zsh? : (y/n)" CONDITION;

if [ "$CONDITION" == "y" ]; then
  echo -e "\n\n-----> Installing oh-my-zsh"
  echo "------------------------"
  sudo rm -rf ~/.oh-my-zsh
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
  git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
fi



