# rules for building and deploying image

.PHONY: push
push: push-cpu push-gpu

.PHONY: push-cpu
push-cpu: build-cpu
	docker push clandininlab/voxelmorph:latest-cpu

.PHONY: push-gpu
push-gpu: build-gpu
	docker push clandininlab/voxelmorph:latest-gpu

.PHONY: build-gpu
build-gpu:
	docker build -t clandininlab/voxelmorph:latest-gpu -f Dockerfile.gpu ${CURDIR}

.PHONY: build-cpu
build-cpu:
	docker build -t clandininlab/voxelmorph:latest-cpu -f Dockerfile ${CURDIR}
