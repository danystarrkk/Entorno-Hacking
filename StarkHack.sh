#!/usr/bin/bash

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

# Exit

function ctrl_c() {
  echo -e "\n\n${redColour}[+] Saliendo .....${endColour}\n\n"
  exit
}

trap ctrl_c SIGINT

# Varibales globlales

rutaP="$HOME"
rutaT="$HOME/Descargas/Entorno-Hacking/configs"

# funciones

function paso1() {
  clear
  #clonamos el repositorio
}

function paso2() {
  clear

  echo -e "${blueColour}\n\n\t Paso 1: Instalación de BSPWM y SXHKD\n\n"
  echo -e "${purpleColour}[+] Instalación de dependecias:\n${endColour}"

  sudo apt install build-essential git vim xcb libxcb-util0-dev libxcb-ewmh-dev libxcb-randr0-dev libxcb-icccm4-dev libxcb-keysyms1-dev libxcb-xinerama0-dev libasound2-dev libxcb-xtest0-dev libxcb-shape0-dev vmname zsh

  if [ $(echo $?) -eq 0 ]; then

    echo -e "${purpleColour}[+] Instalación de BSPWM y SXHKD: \n${endColour}"

    sudo apt install bspwm sxhkd

    cp -r $rutaT/bspwm $rutaP/.config
    cp -r $rutaT/sxhkd $rutaP/.config

    chmod +x $HOME/.config/bspwm/scripts/*

    mkdir $rutaP/Imágenes/.wallpaper
    cp $rutaT/wallpaper $rutaP/Imágenes/.wallpaper

    sleep 10

  else

    echo -e "${redColour}[!] Error en el clonado......${endColour}"

  fi

}

function paso3() {
  clear
  echo -e "${blueColour}\t[+] Instalación de Polybar, Picom y Rofi: \n\n${endColour}"

  sudo apt install picom polybar rofi feh kitty

  cp -r $rutaT/kitty $rutaP/.config

  mv $rutaT/fonts/* /usr/share/fonts

  echo -e "${purpleColour}\n\nConfiguración de Picom: \n\n${endColour}"

  cp -r $rutaT/picom $rutaP/.config

  sleep 10

}

function paso4() {
  echo -e "${blueColour}\t Paso 4: Instalación y configuración zsh y p10k${endColour}"

  echo -e "${purpleColour} \n\n[+] Instalación de las Dependecias\n"

  sudo apt install zsh-autocomplete zsh-syntax-highlighting bat lsd

  sudo mkdir /usr/share/zsh-sudo/

  sudo wget /usr//share/zsh-sudo/sudo.plugin.zsh https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/sudo/sudo.plugin.zsh

  cd

  git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
  echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

  rm -rf $rutaP/.p10k.zsh
  rm -rf $rutaP/.zshrc

  cp $rutaT/files/.zshrc $HOME
  cp $rutaT/files/.p10k.zsh $HOME

  echo "${yellowColour}\n\n Instalación P10k en root:\n\n${endColour}"

  sudo touch /root/.zshrc

  sudo git clone --depth=1 https://github.com/romkatv/powerlevel10k.git /root/powerlevel10k
  echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>/root/.zshrc

  sudo rm -rf /root/.p10k.zsh
  sudo rm -rf /root/.zshrc

  cp $rutaT/files/.zshrc /root
  cp $rutaT/files/.p10k.zsh /root

  rm -rf ~/.config/polybar/
  cp -r $rutaT/polybar $HOME/.config

  sleep 10

}

function paso5() {
  clear
  echo -e "${blueColour}\n\t Paso 5: Instalación del nvim y i3lock${endColour}"

  sudo apt install i3lock

  cp -r $rutaT/nvim $rutaP/.config

  echo "${greenColour}\t \n\nLa configuración se Realizado correctamente \n\n${endColour}"

  sleep 10

}

# Ejercición del Script

paso2
paso3
paso4
paso5
