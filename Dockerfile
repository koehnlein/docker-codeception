FROM composer:1

RUN composer global require codeception/codeception && \
    composer clear-cache

ENV PATH="${COMPOSER_HOME}/vendor/bin:${PATH}"

WORKDIR /app

