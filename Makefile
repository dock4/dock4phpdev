build: dev

dev:
    docker-compose build

build-ncp:
    docker-compose build --no-cache --pull
