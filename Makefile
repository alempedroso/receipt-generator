IMAGE_NAME = receipt-generator

build:
	docker build -t $(IMAGE_NAME) .

run:
	docker run --rm $(IMAGE_NAME)

test:
	docker run --rm $(IMAGE_NAME) bundle exec rspec

clean:
	docker rmi $(IMAGE_NAME)

.PHONY: build run test clean
