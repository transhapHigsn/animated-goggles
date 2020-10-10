# animated-goggles

## SQL Exercise

- Inside `graph` folder.
- Create Postgres Container ```docker run -d -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres -e POSTGRES_DB=postgres --network host postgres```
- Connect to db: ```pgcli postgres://postgres:postgres@localhost:5432/postgres```
- Create Schema and entries ```\i ~/path/animated-googles/graph/create.sql```
- Run select queries ```\i ~/path/animated-googles/graph/select.sql```
- Drop everything ```\i ~/path/animated-googles/graph/drop.sql```

## Algo Exercise
