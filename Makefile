# rules for building and deploying image

.PHONY: push
push: build
	docker push clandininlab/voxelmorph:latest

.PHONY: build
build:
	docker build -t clandininlab/voxelmorph:latest -f Dockerfile ${CURDIR}
