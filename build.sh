export $(cat ./env.properties | sed 's/#.*//g' | xargs)
podman build --layers=false -t smtp-api .
