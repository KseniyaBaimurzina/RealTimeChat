FROM mysql:latest

ENV DB_ROOT='root'
ENV DB_HOSTNAME='localhost'
ENV DB_USERNAME='chat_app'
ENV DB_PASSWORD='chat_app_pass'

COPY createDB.sh /docker-entrypoint-initdb.d/createDB.sh

RUN chmod +x /docker-entrypoint-initdb.d/createDB.sh