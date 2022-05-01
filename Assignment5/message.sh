#!/bin/bash

#this file is exectued by rc.local file

sudo echo "Last reboot time: $(date)" > /home/alex/Desktop/logindata.sh 
#will clear the file of all previous data and write to it last reboot time

sudo echo "User:" $(whoami) >> /home/alex/Desktop/logindata.sh
#will append to the file above information, wanted it to say a user other than root but i think due to it being a sudo command it is always root

HELLO=$(shuf -n 1 /home/alex/Desktop/OKcows)
#created a variable named hello (i know bad var name) that  holds 1 random animal from ok cows


CHOICES=("cowsay" "cowthink")
CHOICES=($(shuf -e ${CHOICES[@]}))
#array of the choices cowsay and cowthink,  it is then shuffled


sudo echo | /usr/games/fortune | /usr/games/${CHOICES[0]} -f $HELLO >> /home/alex/Desktop/logindata.sh
#append to the file, a message from fortune passed to either cowsay or think
#which ever was randomly selected,  using the animal randomly selected and 
#store in variable HELLO is all then appended to the file at OS startup

exit 0
