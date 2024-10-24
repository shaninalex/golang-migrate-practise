start:
	docker compose \
		-f ./docker-compose.yml \
		up -d --build

# stop infrastructure services in docker
stop:
	docker compose \
		-f ./docker-compose.yml \
		stop

clear:
	docker compose \
		-f ./docker-compose.yml \
		down -v

# make migrate_create name="migration_name"
migrate_create:
	migrate create -ext sql -dir database/migration -format "20060102150405" $(name)

migrate_up:
	migrate \
		-path database/migration/ \
		-database "postgres://postgres:postgres@localhost:5432/practice?sslmode=disable" \
		-verbose up

migrate_down:
	migrate \
		-path database/migration/ \
		-database "postgres://postgres:postgres@localhost:5432/practice?sslmode=disable" \
		-verbose down 

migrate_version:
	migrate \
		-path database/migration/ \
		-database "postgres://postgres:postgres@localhost:5432/practice?sslmode=disable" \
		version
