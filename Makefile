CONTAINER_NAME=phpdockerio/health-check-mock
CONTAINER_ARCH=linux/arm/v7,linux/amd64

build-and-push:
	docker buildx build --tag $(CONTAINER_NAME) --tag $(CONTAINER_NAME):latest --platform $(CONTAINER_ARCH) --pull --push .
