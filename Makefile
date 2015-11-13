all:
	docker-compose build
	docker-compose up -d postgres redis
	sleep 2
	docker-compose run --rm sentry sentry upgrade
	docker-compose up -d

deploy:
	docker-compose build sentry worker beat
	docker-compose up --no-deps -d sentry worker beat
