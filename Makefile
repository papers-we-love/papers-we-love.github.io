Leall: clean build/

build/: deps
	time bundle exec middleman build

serve: deps
	bundle exec middleman

deps:
	which bundle || gem install bundler
	bundle check || bundle install

clean:
	rm -rf build/

# Docker commands
docker-build:
	docker compose build

docker-serve:
	docker compose up web

docker-site-build:
	docker compose run --rm build

docker-shell:
	docker compose run --rm web /bin/bash

docker-clean:
	docker compose down -v
	docker rmi pwl-site 2>/dev/null || true

.PHONY: all clean deps serve docker-build docker-serve docker-site-build docker-shell docker-clean

