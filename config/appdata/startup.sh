#!/bin/sh
#
# Ensures proper permissions on the application folder.

chgrp -R 33 /var/www
chmod -R g+r /var/www
