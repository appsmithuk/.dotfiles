#!/bin/bash
# Copy the default config file if not present already

############
# includes #
############

if [ ! -f ./install_config ];
then
    cp ./install_config.diff ./install_config
fi

source ./env
source ./install_config
source ./colors
source install_functions.sh

################
# presentation #
################

echo -e "
${yellow}
          _ ._  _ , _ ._
        (_ ' ( \`  )_  .__)
      ( (  (    )   \`)  ) _)
     (__ (_   (_ . _) _) ,__)
           ~~\ ' . /~~
         ,::: ;   ; :::,
        ':::::::::::::::'
 ____________/_ __ \____________
|                               |
| Welcome to Phantas0s dotfiles |
|_______________________________|
"

echo -e "${yellow}!!! ${red}WARNING${yellow} !!!"
echo -e "${light_red}This script will delete all your configuration files!"
echo -e "${light_red}Use it at your own risks."

if [ $# -ne 1 ] || [ "$1" != "-y" ];
    then
        echo -e "${yellow}Press a key to continue...\n"
        read key;
fi

#TODO put that somewhere else

###########
# INSTALL #
###########

# Install
. $DOTFILES/install/install-from-cloud.sh
. $DOTFILES/install/install-fonts.sh
. $DOTFILES/install/install-prezto.sh
. $DOTFILES/install/install-xorg-server.sh

dot_is_installed git && dot_install projects
dot_is_installed lxappearance && dot_install theme
dot_is_installed i3 && dot_install i3
dot_is_installed urxvt && dot_install urxvt
dot_is_installed git && dot_install git
dot_is_installed nvim && dot_install nvim
dot_is_installed tmux && dot_install tmux
dot_is_installed dunst && dot_install dunst
dot_is_installed feh && dot_install feh
dot_is_installed fzf && dot_install fzf
dot_is_installed jrnl && dot_install jrnl
dot_is_installed composer && dot_install composer
dot_is_installed mycli && dot_install mycli
dot_is_installed pgcli && dot_install pgcli
dot_is_installed go && dot_install_func go install_go_binaries
dot_is_installed php && dot_install php
dot_is_installed npm && dot_install javascript
dot_is_installed compton && dot_install compton
dot_is_installed bat && dot_install bat
dot_is_installed joplin && dot_install joplin
dot_is_installed vifm && dot_install vifm
dot_is_installed lein && dot_install clojure-lein
dot_is_installed freemind && dot_install freemind
dot_is_installed redshift && dot_install redshift
dot_is_installed xmodmap && dot_install xmodmap
dot_is_installed mpd && dot_is_installed ncmpcpp && dot_install mpd

# Source startup
source $DOTFILES/startup
