# Papers We Love Website - Makefile
# Run `make help` to see available commands

.DEFAULT_GOAL := help

# Local development (requires Ruby 3.3)
all: clean build

build: deps
	time bundle exec middleman build

serve: deps
	bundle exec middleman server

deps:
	which bundle || gem install bundler
	bundle check || bundle install

clean:
	rm -rf build/

# Docker commands (recommended)
docker-build:
	docker compose build

docker-build-no-cache:
	docker compose build --no-cache

docker-serve:
	docker compose up web

docker-site-build:
	docker compose run --rm build

docker-shell:
	docker compose run --rm web /bin/bash

docker-deploy:
	docker compose run --rm deploy

docker-clean:
	docker compose down -v
	docker volume rm papers-we-lovegithubio_bundle_cache 2>/dev/null || true

docker-logs:
	docker compose logs -f web

# Help
help:
	@echo "Papers We Love Website - Development Commands"
	@echo ""
	@echo "Docker commands (recommended):"
	@echo "  make docker-build         Build the Docker image"
	@echo "  make docker-build-no-cache Rebuild image without cache"
	@echo "  make docker-serve         Start dev server at http://localhost:4567"
	@echo "  make docker-site-build    Build static site to /build"
	@echo "  make docker-shell         Open a shell in the container"
	@echo "  make docker-deploy        Deploy to GitHub Pages"
	@echo "  make docker-logs          Follow container logs"
	@echo "  make docker-clean         Remove containers and volumes"
	@echo ""
	@echo "Local commands (requires Ruby 3.3):"
	@echo "  make serve                Start local dev server"
	@echo "  make build                Build static site"
	@echo "  make deps                 Install dependencies"
	@echo "  make clean                Remove build directory"
	@echo ""

.PHONY: all build clean deps serve help \
        docker-build docker-build-no-cache docker-serve docker-site-build \
        docker-shell docker-deploy docker-clean docker-logs
