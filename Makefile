# Grep the version from the mix file
#VERSION=$(shell ./version.sh)

DOCKER_COMMAND="docker-compose -f docker-compose.yml"

# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

# DOCKER TASKS

build: ## Build image
	docker build . -t dr4g0nsr/freeradius -t dr4g0nsr/freeradius:latest -t dr4g0nsr/freeradius:1.0

start: ## Start containers
	docker-compose up -d

