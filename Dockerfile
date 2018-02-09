#
# Sets up a development container
#

FROM postgres:9.6-alpine

# PGXS depenencies
RUN apk --update add make diffutils

WORKDIR /usr/local/src
COPY . .
RUN make install

