.PHONY: dev
dev:
	docker-compose -f development/docker-compose.yaml up --build

.PHONY: iscogram
iscogram:
	docker-compose -f iscogram/docker-compose.yaml up --build