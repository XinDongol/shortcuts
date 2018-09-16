#!/bin/bash

# for ubuntu 18.04

# fillezilla
sudo apt install filezilla

# sublime 
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

sudo apt-add-repository "deb https://download.sublimetext.com/ apt/stable/"

sudo apt install sublime-text

# cuda 9.0
# https://gist.github.com/Mahedi-61/2a2f1579d4271717d421065168ce6a73

# system monitor
sudo add-apt-repository ppa:fossfreedom/indicator-sysmonitor
sudo apt-get update
sudo apt-get install indicator-sysmonitor

#auto jump
git clone git://github.com/wting/autojump.git
cd autojump
./install.py or ./uninstall.py
