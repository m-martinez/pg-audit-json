#
# Development-only container
#
#

ARG POSTGRES_VERSION=9.6
FROM postgres:${POSTGRES_VERSION}

RUN apt-get update && \
    apt-get install -y make diffutils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* \

ARG PG_AUDIT_JSON_VERSION
ENV PG_AUDIT_JSON_VERSION=${PG_AUDIT_JSON_VERSION:-1.0.2}
WORKDIR /usr/local/src
COPY . .
RUN make install

RUN echo "CREATE EXTENSION \"pg-audit-json\" WITH VERSION '${PG_AUDIT_JSON_VERSION}'" > /docker-entrypoint-initdb.d/000-initdb.sql
