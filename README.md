**Environment**

1. os version (centos 8.2)
2. podman version (3.0.2-dev)
3. node version (10.24.0) run `sudo dnf install -y nodejs` to install
4. suggest to run `sudo dnf update -f && sudo dnf clean all` first
---

**How to use the container?**

1. update *env.properties* to set the SMTP related properties
2. run `sh build.sh` to build the image to localhost/smtp-api
3. run `sh run.sh` to deploy the pod as name: smtp-api, or run
   
   `
   podman run --replace --name smtp-api -d -p 18080:8080 -e SMTP_USER='your@gmail.com' -e SMTP_PASS='password' localhost/smtp-api
   `
   *remark: other environment variables are: SMTP_HOST, SMTP_PORT, SMTP_TLS (true/false)
   *remark: --replace=true only avaliable in podman v2.0.6 or later*
4. update *test.sh* for the *from* and *to*
5. run `sh test.sh` to send email
---

**How to develop the application?**

1. update *env.properties* to set the SMTP related properties
2. run `export $(cat ./env.properties | sed 's/#.*//g' | xargs)` to add env
3. run `cd app` to the project directory
4. edit *src/server.js*
5. run `npm install && npm run start` to start the server
6. update *test-local.sh* for the *from* and *to*
7. run `sh test-local.sh` to send email
---

**How to push the local container to public registry?**

1. create a public reposistory in quay.io
2. run `podman login quay.io` to login
3. run `podman push localhost/smtp-api quay.io/<your-account>/smtp-api` to push
---

**How to run pod in OpenShift?**

1. use `oc login ...` to login
2. run `oc new-app --name smtp-api -e SMTP_USER='your@gmail.com' -e SMTP_PASS='password' quay.io/daniel4wong/smtp-api` to create deployment and pod
3. run `oc expose service/smtp-api` to create route
4. run `oc get route/smtp-api` to check the public url
