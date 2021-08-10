current=$(date +"%Y%m%d%H%M%S")
curl -X POST http://127.0.0.1:18080/send \
  -H 'Content-Type: application/json' \
  -d "{ \"from\":\"sender@gmail.com\", \"to\":\"recipient@gmail.com\", \"subject\":\"Email from smtp-api\", \"message\":\"${current}\" }" 
