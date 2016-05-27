#!/bin/bash

file=/tmp/speedTest.txt
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
velocidad(){
        checarInternet
        if [ "$isAvailable" == "$online" ]
                then
                /usr/bin/python /usr/local/bin/speedtest-cli --simple > $file
                ping=$(sed -n '1p' $file | awk '{print $2}')
                download=$(sed -n '2p' $file | awk '{print $2}')
                upload=$(sed -n '3p' $file | awk '{print $2}')
                rm -rf $file
                mysql -u <user> -p<password>ERT INTO domotic.speedTest VALUES(now(),$ping,$download,$upload)"
                echo $ping $download $upload
        elif [ "$isAvailable" == "$offline" ]
        then
                mysql -u <user> -p<password> -e "INSERT INTO domotic.speedTest VALUES(now(),0,0,0)"
        fi
}
velocidad
