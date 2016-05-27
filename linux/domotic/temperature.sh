#!/bin/bash
# 10,30,50 * * * * /home/pi/Scripts/linux/domotic/temperature.sh

target="192.168.0.251"
open="open"
closed="closed"

consultar(){
        servie=$(/usr/bin/nmap -p 80 $target | grep 80 | awk '{ print $2 }')
}

temperatura(){
        consultar
        if [ $servie = $open ]
                then
                echo $servie
                echo $open
                json=$(curl $target/temperatura | awk '{ print $1}' | sed -e 's/\[{"tempIn":\(.*\),/\1/')
                if [ -z "$json" ]
                then
                        echo "No regreso ningun Json"
                else
                        echo "La Temperatura del cuarto es de: "
                        #celcius=$($json | awk '{ print $1}' | sed -e 's/\[{"tempIn":\(.*\),/\1/')
                        echo $json
                        mysql -u <user> -p<password> -e "INSERT INTO domotic.temperatura VALUES(now(),$json)"
                fi
        fi

}

temperatura

#CREATE TABLE temperatura (fecha TIMESTAMP DEFAULT CURRENT_TIMESTAMP, temperatura decimal(5,2));
#INSERT INTO temperatura VALUES(now(), 18.02)
