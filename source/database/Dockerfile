FROM postgres:latest

ENV POSTGRES_DB=codemonkeydb
ENV POSTGRES_USER=admin
ENV POSTGRES_PASSWORD=password

ADD init.sql /docker-entrypoint-initdb.d/

