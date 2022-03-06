#!/bin/bash

sed -i 's+^#svn_roots\s*=.*$+svn_roots = svn: '${repository}'+g' \
    /usr/local/viewvc/viewvc.conf

### for debug
#sed -i 's+^#stacktraces\s*=.*$+stacktraces = 1+g' \
#    /usr/local/viewvc/viewvc.conf

mkdir /home/www-data
chown www-data:www-data -R /home/www-data
chmod 2755 /home/www-data

/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
