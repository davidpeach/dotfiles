#!/bin/bash
read name
echo ${name}
# MAP project folders to container names.
declare -A MAPPING
MAPPING["davidpeach.me"]="davidpeachme-laravel.test-1"

# DETERMINE the current full directory path
CURRENT_DIRECTORY=$(pwd)

# PARSE the directory path into an array
IFS='/' read -r -a PATH_ARRAY <<< "$CURRENT_DIRECTORY"

CONTAINER_NAME=""

for FOLDER in ${PATH_ARRAY[@]} 
do
    if [ ! -z $FOLDER ] && [ ${MAPPING[$FOLDER]+truthtest} ]
    then
        CONTAINER_NAME="${MAPPING[$FOLDER]}"
    fi
done

if [ -z ${CONTAINER_NAME} ]
then
    echo "No suitable docker container could be determined."
    exit 1
fi

declare -A COMMANDS

artisan="docker exec %s php artisan"
COMMANDS["clear-compiled"]="docker exec %s php artisan"

# Generators
COMMANDS["make:cast"]="${artisan} make:cast"
COMMANDS["make:channel"]="${artisan} make:channel"
COMMANDS["make:command"]="${artisan} make:command"
COMMANDS["make:component"]="${artisan} make:component"
COMMANDS["make:controller"]="${artisan} make:controller"
COMMANDS["make:event"]="${artisan} make:event"
COMMANDS["make:exception"]="${artisan} make:exception"
COMMANDS["make:factory"]="${artisan} make:factory"
COMMANDS["make:cast"]="${artisan} make:cast"
COMMANDS["make:cast"]="${artisan} make:cast"
COMMANDS["make:cast"]="${artisan} make:cast"
COMMANDS["make:cast"]="${artisan} make:cast"
COMMANDS["make:cast"]="${artisan} make:cast"
COMMANDS["make:cast"]="${artisan} make:cast"
COMMANDS["make:cast"]="${artisan} make:cast"
COMMANDS["make:cast"]="${artisan} make:cast"
COMMANDS["make:cast"]="${artisan} make:cast"

# Migrations
COMMANDS["migrate"]="${artisan} migrate"
COMMANDS["migrate:fresh"]="${artisan} migrate:fresh"
COMMANDS["migrate:fresh --seed"]="${artisan} migrate:fresh --seed"
COMMANDS["migrate:rollback"]="${artisan} migrate:rollback"

CHOICE=$(printf '%s\n' "${!COMMANDS[@]}" | dmenu -i -l 20 -p 'Run in local container: ')

# RUN the final command
if [ "$CHOICE" ]; then
    read className | nvim -
    echo "HERE"
#    $(printf "${COMMANDS[$CHOICE]}" "$CONTAINER_NAME") "$className $@"
fi
