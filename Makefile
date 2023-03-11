all: clean build/

build/: deps
	time bundle exec middleman build

serve: deps
	bundle exec middleman

deps:
	which bundle || gem install bundler
	bundle check || bundle install

clean:
	rm -rf build/

all: setup run

docker-setup:
	docker-compose build

docker-run:
	docker-compose run --rm --service-ports ruby_dev

docker-cleanup:
	docker-compose down
	docker rmi pwlconf_ruby_dev


.PHONY: all clean deps serve docker-setup docker-run docker-cleanup
