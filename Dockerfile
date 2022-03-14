FROM jenkins/jenkins:lts

LABEL maintainer="Paulo Romanenghi"

USER root

RUN apt-get update && apt-get install -y \
    mariadb-client postgresql-client unzip wget libunwind8 libicu-dev \ 
    && wget -O sqlpackage.zip https://aka.ms/sqlpackage-linux \
    && unzip sqlpackage.zip -d /opt/sqlpackage \
    && chmod +x /opt/sqlpackage/sqlpackage \
    && rm /sqlpackage.zip

ENV PATH=$PATH:/opt/mssql-tools/bin:/opt/sqlpackage

RUN mkdir /opt/jenkins_scripts \
          /opt/mysql_backup \
          /opt/postgres_backup \
          /opt/mssql_backup

COPY ./jenkins_scripts /opt/jenkins_scripts

USER jenkins