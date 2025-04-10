#!/bin/bash

CONTAINER_UID=${HOST_UID:-1000}
CONTAINER_GID=${HOST_GID:-1000}
USER_NAME=ubuntu

groupadd -g "$CONTAINER_GID" "$USER_NAME" 2> /dev/null
useradd -m -u "$CONTAINER_UID" -g "$CONTAINER_GID" "$USER_NAME" 2> /dev/null

exec gosu "$USER_NAME" "$@"
