podman build --layers=false -t smtp-api . \
  --build-arg $(cat env.properties |  sed 's/#.*//g' | grep SMTP_HOST) \
  --build-arg $(cat env.properties |  sed 's/#.*//g' | grep SMTP_PORT) \
  --build-arg $(cat env.properties |  sed 's/#.*//g' | grep SMTP_TLS) \
  --build-arg $(cat env.properties |  sed 's/#.*//g' | grep SMTP_USER) \
  --build-arg $(cat env.properties |  sed 's/#.*//g' | grep SMTP_PASS)
