TAG=$(shell git rev-parse --short HEAD)
IMAGE=promptworks/smorgasbord
PWD=$(shell pwd)
MOUNT=$(PWD)/bin/dump-versions:/bin/dump-versions

build:
	docker build -t $(IMAGE):$(TAG) -t $(IMAGE):latest .
	docker run -v "$(MOUNT)" -it promptworks/smorgasbord:$(TAG) dump-versions > versions.txt

push: build
	docker push $(IMAGE):$(TAG)
	docker push $(IMAGE):latest

