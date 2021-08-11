Environment

1. os version (centos 8.2)
2. podman version (3.0.2-dev)
3. node version (10.24.0) run `sudo dnf install -y nodejs` to install
4. suggest to run `sudo dnf update -f && sudo dnf clean all` first


How to use the container?

1. update *env.properties* to set the SMTP related properties
2. run `export $(cat ./env.properties | sed 's/#.*//g' | xargs)` to add env
3. run `sh build.sh` to build the image to localhost/smtp-api
4. run `sh run.sh` to deploy the pod as name: smtp-api, or run
   `podman run --name smtp-api -d -p 18080:8080 localhost/smtp-api -e SMTP_USER="your@gmail.com" -e SMTP_PASS="password" --replace=true`
   *--replace=true only avaliable in podman v2.0.6 or later*
6. update *test.sh* for the *from* and *to*
7. run `sh test.sh` to send email


How to develop the application?

1. update *env.properties* to set the SMTP related properties
2. run `export $(cat ./env.properties | sed 's/#.*//g' | xargs)` to add env
3. run `cd app` to the project directory
4. edit *src/server.js*
5. run `npm install && npm run start` to start the server
6. update *test-local.sh* for the *from* and *to*
7. run `sh test-local.sh` to send email
