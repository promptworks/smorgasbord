TAG=$(shell git rev-parse --short HEAD)
IMAGE=promptworks/smorgasbord

build:
	docker build -t $(IMAGE):$(TAG) -t $(IMAGE):latest .

push: build
	docker push $(IMAGE):$(TAG)
	docker push $(IMAGE):latest

