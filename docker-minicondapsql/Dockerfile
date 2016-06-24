FROM continuumio/miniconda:latest

run apt-get install postgresql-9.4 postgresql-client-9.4 --assume-yes 

ADD ./entry.sh /entry.sh
RUN chmod 755 /entry.sh

EXPOSE 8888

ENTRYPOINT ["/entry.sh"]