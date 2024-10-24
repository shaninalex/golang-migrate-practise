# golang-migrate usage example

```bash

# first run database
docker compose -f docker-compose.yml up -d --build

# then create migration ( create migrations can be via cli tool or manually ):
migrate create -ext sql -dir database/migration -format "20060102150405" <migration_name>

# This command creates two files:
#    database/migration/<timestamp>_<migration_name>.up.sql
#    database/migration/<timestamp>_<migration_name>.down.sql

# NOTE:
# example migrations created with sequence format ( 000001_<migrationName>.up/down.sql ). To do this instead of 
# `-format "20060102150405"` use `-seq`. This bunch of numbers are golang format for dates. You can try to use another
# format https://gosamples.dev/date-time-format-cheatsheet/ but I did not test it...
# both formats can be applied, but, of course it's better to use single format.

# To apply all pending migrations:
migrate \
    -path database/migration/ \
    -database "postgres://postgres:postgres@localhost:5432/practice?sslmode=disable" \
    -verbose up 

# rollback last migration
migrate \
    -path database/migration/ \
    -database "postgres://postgres:postgres@localhost:5432/practice?sslmode=disable" \
    -verbose down 

# this command will move database to the previous state.
```

If migration was failed migrations will be in "dirty" state. To fix this follow this workflow:

```bash
# 1
# Roll back last migration
migrate \
    -path database/migration/ \
    -database "postgres://postgres:postgres@localhost:5432/practice?sslmode=disable" \
    -verbose down

# 2
# fix/change last migration files

# 3
# apply it again
migrate \
    -path database/migration/ \
    -database "postgres://postgres:postgres@localhost:5432/practice?sslmode=disable" \
    -verbose up 
```


Using flag `-verbose` just print more log into console.


### also

To apply migrations for test environments - just change db path. For commands. Golang-migrate tool accept env variables,
and db path and migrations folder can be apply through them.
