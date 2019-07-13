.PHONY: dev
dev:
	docker-compose -f development/docker-compose.yaml up --build

.PHONY: iscogram
iscogram:
	docker-compose -f iscogram/docker-compose.yaml up --build
	
iscogram/init.sql.gz:
	curl -L -O https://github.com/catatsuy/private-isu/releases/download/img/dump.sql.bz2
	bzcat dump.sql.bz2 | gzip > iscogram/init.sql.gz
	rm dump.sql.bz2