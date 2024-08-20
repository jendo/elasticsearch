# COLORS
RED  := $(shell tput -Txterm setaf 1)
GREEN  := $(shell tput -Txterm setaf 2)
YELLOW := $(shell tput -Txterm setaf 3)
BLUE   := $(shell tput -Txterm setaf 4)
EOL  := $(shell tput -Txterm sgr0)

#VVARIABLES
PHP_NAME = $(shell docker ps -q -f name=elasticsearch_php)
ES_NAME = $(shell docker ps -q -f name=elasticsearch_elasticsearch)

up:
	COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 docker-compose --env-file=.env.dev up -d --force-recreate --build --remove-orphans
down:
	COMPOSE_DOCKER_CLI_BUILD=1 DOCKER_BUILDKIT=1 docker-compose --env-file=.env.dev down --volumes --remove-orphans

php-bash:
	@echo "${GREEN}>>> Entering container bash${EOL}"
	docker exec -u 1000:1000 -it ${PHP_NAME} bash

es-bash:
	@echo "${GREEN}>>> Entering container bash${EOL}"
	docker exec -u 1000:1000 -it ${ES_NAME} bash
