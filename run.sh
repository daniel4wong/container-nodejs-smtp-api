podman rm -f smtp-api
podman run --name smtp-api -d -p 18080:8080 localhost/smtp-api
podman ps && podman logs smtp-api
