#!/usr/bin/env bash
# jirrezdex@gmail.com
# Jirrez Matheus

res=$(echo "-Bloquear;-Sair;-Reiniciar;-Desligar" | rofi -sep ";" -dmenu -p "Controle do sistema" -bw 0 -separator-style none -location 0 -width 20 -lines 4 -padding 5)
if [ ! -z $res ]; then
  case $res in
    -Bloquear)
    ;;
    -Sair)
      i3-msg exit
    ;;
    -Reiniciar)
      systemctl reboot
    ;;
    -Desligar)
      systemctl poweroff
    ;;
  esac
fi
