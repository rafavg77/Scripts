#!/bin/bash
x="$1"
#read x
  case $x in
     1)
        echo "Se enciende/apaga TV"
        curl http://192.168.0.251/tvon
     ;;
     2)
        echo "Volumen Up"
        curl http://192.168.0.251/tvon
     ;;
     3)
        echo "Volumen Down"
        curl http://192.168.0.251/voldown
     ;;
     4)
        echo "Channel 7 HD"
        curl http://192.168.0.251/azteca_hd
     ;;
     *)
        echo "No se reconoce el comando"
     ;;
  esac
