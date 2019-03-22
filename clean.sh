#!/bin/bash

FILE='/tmp/list.txt'

function GENERATE () {

        find /var/lib/docker/home/docker/workspace/ -maxdepth 1 -type d -mtime +20 | cut -d '/' -f8 | uniq > "$FILE"
}

function CHECK_FILE () {

        if [[ -f $FILE ]]; then
          echo "Arquivo disponibilizado em $FILE !"
        else
          echo "Arquivo não encontrado"
        fi
}

function REMOVE_DIRS (){

                while read LINE; do cd /var/lib/docker/home/docker/workspace/ && rm -rf "$LINE"; done < "$FILE"

}
GENERATE
CHECK_FILE
REMOVE_DIRS
