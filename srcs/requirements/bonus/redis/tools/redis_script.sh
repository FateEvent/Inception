#!/bin/sh

redis-server /etc/redis/redis.conf

# https://linuxhint.com/redis-acl
ACL SETUSER ${REDIS_LOGIN} ON >${REDIS_PASSWORD}