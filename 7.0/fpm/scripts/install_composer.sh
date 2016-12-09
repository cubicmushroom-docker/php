#!/usr/bin/env sh

# IMPORTANT NOTE
# ==============
# This file is copied into each of the docker container version directories that need it to allow them to use it
# without 'out of scope' errors.  The file also needs to be committed in order for the Docker Hub build script to work
# successfully.
# Therefore, please make sure you only update the script in the <root>/scripts directory, and run `make prepare` to
# update the copied versions before pushing your changes

EXPECTED_SIGNATURE=$(wget -q -O - https://composer.github.io/installer.sig)
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_SIGNATURE=$(php -r "echo hash_file('SHA384', 'composer-setup.php');")

if [ "$EXPECTED_SIGNATURE" != "$ACTUAL_SIGNATURE" ]
then
    >&2 echo 'ERROR: Invalid installer signature'
    rm composer-setup.php
    exit 1
fi

php composer-setup.php --quiet
RESULT=$?
rm composer-setup.php
exit $RESULT