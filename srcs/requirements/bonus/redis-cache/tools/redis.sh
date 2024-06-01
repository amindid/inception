#!/bin/bash

sed -i 's/^bind .*/bind 0.0.0.0/' /etc/redis/redis.conf

sed -i 's/^protected-mode yes/protected-mode no/' /etc/redis/redis.conf

redis-server --protected-mode no

exec "$@"