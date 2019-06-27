TAG=$(shell git rev-parse --short HEAD)
IMAGE=promptworks/smorgasbord:$(TAG)

build:
	docker build -t $(IMAGE) .

push: build
	docker push $(IMAGE)

