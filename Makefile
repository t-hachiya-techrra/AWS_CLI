build:
	HOST_UID=$$(id -u) HOST_GID=$$(id -g) docker compose build
rebuild:
	HOST_UID=$$(id -u) HOST_GID=$$(id -g) docker compose build --no-cache --pull
run: build
	HOST_UID=$$(id -u) HOST_GID=$$(id -g) docker compose run --rm aws
