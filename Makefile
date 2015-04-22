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

.PHONY: all clean deps serve
