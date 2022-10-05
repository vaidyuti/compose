
.PHONY: restart, build, re-build, up, down, list, logs

 
DOCKER_VERSION := $(shell docker --version 2>/dev/null)
DOCKER_COMPOSE_VERSION := $(shell docker-compose --version 2>/dev/null)

COMPOSE_ENV ?= 'dev'
docker_config_file = docker-compose.yaml -f docker-compose.$(COMPOSE_ENV).yaml

all:
ifndef DOCKER_VERSION
    $(error "command docker is not available, please install Docker")
endif
ifndef DOCKER_COMPOSE_VERSION
    $(error "command docker-compose is not available, please install Docker")
endif

restart:
	docker-compose -f $(docker_config_file) restart
re-build:
	docker-compose -f $(docker_config_file) build --no-cache

build:
	docker-compose -f $(docker_config_file) build

up:
	docker-compose -f $(docker_config_file) up -d

down:
	docker-compose -f $(docker_config_file) down

list:
	docker-compose -f $(docker_config_file) ps

logs:
	docker-compose -f $(docker_config_file) logs