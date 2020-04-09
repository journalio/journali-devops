#!/usr/bin/env bash

echo "      _                              _ _ 
     | |                            | (_)
     | | ___  _   _ _ __ _ __   __ _| |_ 
 _   | |/ _ \| | | | '__| '_ \ / _\` | | |
| |__| | (_) | |_| | |  | | | | (_| | | |
 \____/ \___/ \__,_|_|  |_| |_|\__,_|_|_|
"

BASE_COMMAND="docker-compose -f docker-compose.builder.yml run --rm"

case $1 in
    init)
        echo " - Initializing repository"
        git clone git@github.com:WesleyKlop/journali-frontend.git frontend
        git clone git@github.com:WesleyKlop/journali-api.git api
        ;;
    install)
        echo " - Installing frontend dependencies for the frontend"
        eval $BASE_COMMAND install
        ;;
    migrate)
        echo " - Migrating database"
        # TODO
        ;;
    start)
        echo " - Starting development environment"
        docker-compose up -d
        ;;
    stop)
        echo " - Stopping development environment"
        docker-compose down
        ;;
    help)
        echo "Available commands:
 - init: Initialize the child repositories
 - install: Intall frontend node dependencies
 - migrate: Migrate the database
 - start: Start the development environment
 - stop: Stop the development environment
 - help: This command"
        ;;
    *)
        echo "Unknown command \"$1\""
        exit 1
esac