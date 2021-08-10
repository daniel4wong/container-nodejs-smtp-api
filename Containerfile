FROM node:14

MAINTAINER Daniel Wong <daniel4wong@gmail.com>

ARG BUILD='PRD'
ENV SMTP_HOST=${SMTP_HOST} \
    SMTP_PORT=${SMTP_PORT} \
    SMTP_TLS=${SMTP_TLS} \
    SMTP_USER=${SMTP_USER} \
    SMTP_PASS=${SMTP_PASS}

ENV APP_HOME=/opt/src/app \
    APP_PORT=8080 \
    LOG_DIR=/tmp/log

# Create app directory
WORKDIR ${APP_HOME}

# Copy source
COPY app/package*.json ${APP_HOME}/
COPY app/src/* ${APP_HOME}/src/

# Build application
RUN if [ ${BUILD} != 'PRD' ]; then \
      npm install \
    ; else \
      npm ci \
    ; fi

# Print debug information
RUN if [ ${BUILD} != 'PRD' ]; then \
      echo '+++' && node -v && echo '---' && npm -v && echo '---' && pwd && echo '---' && ls -la && echo '+++' \
    ; fi

EXPOSE ${APP_PORT}

CMD ["node", "src/server.js"]
