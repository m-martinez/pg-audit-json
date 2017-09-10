#
# Sets up a development container
#

FROM postgres:9.6-alpine

# PGXS depenencies
RUN apk --update add make diffutils

ADD . /usr/local/src
RUN cd /usr/local/src/ && make && make install

