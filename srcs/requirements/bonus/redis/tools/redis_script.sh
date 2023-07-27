#!/bin/sh

redis-server /etc/redis/redis.conf
redis-cli PING