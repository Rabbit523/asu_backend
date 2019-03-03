# I: Runtime Stage: ============================================================
# This is the stage where we build the runtime base image, which is used as the
# common ancestor by the rest of the stages, and contains the minimal runtime
# dependencies required for the application to run:

# 1: Start off from Ruby 2.5.1 on Alpine Linux 3.7:
FROM php:7-fpm-alpine AS runtime

# 2: We'll set '/usr/src' path as the working directory:
WORKDIR /usr/src

# 3: We'll set the working dir as HOME and add the app's binaries path to $PATH:
ENV HOME=/usr/src \
    PATH=/usr/src:/usr/src/bin:$PATH

# 4: Install the common runtime dependencies:
RUN apk add --no-cache ca-certificates less libpq libpng libxslt nodejs openssl tzdata 

# II: Development Stage: =======================================================
# In this stage we'll build the image used for development, including compilers,
# and development libraries. This is also a first step for building a releasable
# Docker image:

# 1: Start off from the "runtime" stage:
FROM runtime AS development

# 2: Install the development dependency packages with alpine package manager:
RUN apk --no-cache add --virtual .build-deps $PHPIZE_DEPS \
  && apk --no-cache add --virtual .ext-deps libmcrypt-dev freetype-dev \
  libjpeg-turbo-dev libpng-dev libxml2-dev mysql-client \
  && docker-php-source extract \
  && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ \
                                   --with-png-dir=/usr/include/ \
                                   --with-jpeg-dir=/usr/include/ \
  && docker-php-ext-install gd pdo pdo_mysql zip \
  && pecl install xdebug \
  && docker-php-ext-enable xdebug  \
  && docker-php-source delete \
  && apk del .build-deps


COPY ./xdebug.ini /usr/local/etc/php/conf.d/xdebug.ini

# Install composer:
ENV COMPOSER_ALLOW_SUPERUSER=true
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
RUN composer --version

# III: Builder stage: ==========================================================
# In this stage we'll compile assets coming from the project's source, do some
# tests and cleanup. If the CI/CD that builds this image allows it, we should
# also run the app test suites here:

# 1: Start off from the development stage image:
FROM development AS builder

# 2: Copy the rest of the application code
ADD . /usr/src

# 4: Copy the current project dependencies from stage 0 - they can be safely changed later during
# development via `composer install` or `composer update`:
RUN composer install --no-dev --no-interaction

# IV: Deployable stage: ========================================================
# In this stage, we build the final, deployable Docker image, which will be
# smaller than the images generated on previous stages:

# 1: Start off from the runtime stage image:
FROM runtime AS deployable

# 3: Change the owner of the '/usr/src'  directory (which should be empty at
# this point):
RUN chown -R nobody:nobody /usr/src

# 4: Copy from app code from the "builder" stage, which at this point should
# have the assets from the asset pipeline already compiled:
COPY --from=builder --chown=nobody:nobody /usr/src /usr/src

# 5: Set the RAILS/RAC

# 6: Set the container user to 'nobody':
USER nobody
