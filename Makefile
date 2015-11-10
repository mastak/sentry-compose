LOCAL_ENVS=envs.mk

ifneq ($(wildcard ${LOCAL_ENVS}),)
    include ${LOCAL_ENVS}
endif

ifndef DB_NAME
	export DB_NAME=sentry
endif
ifndef DB_USER
	export DB_USER=sentry
endif
ifndef DB_PASSWORD
	export DB_PASSWORD=secret
endif

all:
	docker-compose build
	docker-compose up -d data postgres redis
	sleep 2
	docker-compose run --rm sentry sentry upgrade
	docker-compose up -d

ps:
	docker-compose ps
