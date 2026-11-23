FROM php:8.6-apache

# Apply Debian security fixes released since the upstream php image was last built.
RUN apt-get update \
 && DEBIAN_FRONTEND=noninteractive apt-get -y upgrade \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN a2enmod unique_id rewrite headers
