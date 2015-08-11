#!/bin/bash
set -e

ln -srf /read-only/* /data/ || true
ln -srf /read-only/.[^.]* /data/

/usr/sbin/sshd -D
