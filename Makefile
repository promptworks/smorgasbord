TAG=$(shell git rev-parse --short HEAD)
IMAGE=promptworks/smorgasbord
PWD=$(shell pwd)
MOUNT=$(PWD)/bin/dump-versions:/bin/dump-versions

build:
	docker build -t $(IMAGE):$(TAG) .
	docker run -v "$(MOUNT)" -it promptworks/smorgasbord:$(TAG) dump-versions > versions.txt

push: build
	docker tag $(IMAGE):$(TAG) $(IMAGE):latest
	docker push $(IMAGE):$(TAG)
	docker push $(IMAGE):latest

