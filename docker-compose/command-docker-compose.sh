# start the docker composeri in config yaml file
docker compose start

# show container in config yaml file
docker compose ps

# stop the docker compose in config yaml file
docker compose stop

# delete/remove all(container, volume, networks) in config yaml file 
docker compose down

# to show all docker compose project
docker compose ls 

# show container event in realtime 
docker events
docker events --filter'<key>=<value>'

# run docker compose with extend service
docker compose -f docker-compose.yaml -f <filename>.yaml <dockercommand>