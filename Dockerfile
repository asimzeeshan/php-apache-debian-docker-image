FROM php:8.4-apache

RUN a2enmod unique_id rewrite
