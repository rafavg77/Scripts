#!/bin/bash
# Add this line to crontab */1 * * * * /home/pi/Scripts/network/sshtunnel/sshTunnel.sh > /home/pi/Scripts/network/sshtunnel/tunnel.log 2>&1

online="Online"
offline="Offline"

checarInternet(){
        wget -q --spider http://google.com

        if [ $? -eq 0 ]; then
            echo "Online"
            isAvailable="Online"
        else
            echo "Offline"
            isAvailable="Offline"
        fi
}

createTunnel() {
  /usr/bin/ssh -N -R 2222:localhost:22 user@mydomain.com
  if [[ $? -eq 0 ]]; then
    echo Tunnel to Server created successfully
  else
    echo An error occurred creating a tunnel to Server. RC was $?
  fi
}

pidSSH(){
        checarInternet
        if [ "$isAvailable" == "$online" ]
        then
                /bin/pidof ssh
                if [[ $? -ne 0 ]]; then
                        echo Creating new tunnel connection
                        createTunnel
                fi
        elif [ "$isAvailable" == "$offline" ]
        then
                kill -9 $(/bin/pidof ssh)
        fi
}
pidSSH
