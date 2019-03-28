#!/bin/sh
BASE=/opt/TalentCloud/var/www

if [ -f $BASE/.setup ]; then
  echo -n talentcloud has a setup file from `cat $BASE/.setup`
else
  echo "running talentcloud-op setup via op-assert.sh"
  if [ ! -d /var/log/nginx ]; then
    mkdir /var/log/nginx/
  fi && \
  # FIXME commands other than gen-certs should be run as non-root user
  make gen-certs env composer-install laravel-init fresh-db fake-data npm-install-cross-env-global npm-install-no-bin-links npm-dev && \
  for i in storage bootstrap/cache; do
    chgrp -R www-data $BASE/$i && \
    chmod -R g+rxws $BASE/$i
  done
  date > $BASE/.setup
fi

# wait around for op commands
sleep 365d
