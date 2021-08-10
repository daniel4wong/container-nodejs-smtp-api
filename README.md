How to use the container?

1. update **env.properties** to set the SMTP related properties
2. run `sh build.sh` to build the image to localhost/smtp-api
3. run `sh run.sh` to deploy the pod as name: smtp-api
4. update **test.sh** for the **from** and **to**
5. run `sh test.sh` to send email

How to develop the application?

1. run `cd app` to the project directory
2. edit **src/server.js**
3. run `npm run start` to start the server
4. update **test-local.sh** for the **from** and **to**
5. run `sh test-local.sh` to send email
