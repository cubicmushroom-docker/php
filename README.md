PHP Docker Containers
=====================

Customised PHP containers extended from the vendor PHP ones


Versions
--------

* cubicmushroom/php:7.0-fpm
* cubicmushroom/php:7.0-fpm-dev


The various versions are build from Dockerfile in the directory relative to the name of the image (e.g. php:7.0-fpm is 
in `7.0/fpm`, and php:7.0-fpm-dev is in `7.0/fpm/dev`.


Composer
--------

All containers include composer.


Building containers
-------------------

In order to build the containers you will first need to copy the script files into each version directory to avoid an 
'out of scope error'.  You can do this by running…

    $ make prepare