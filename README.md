# animated-goggles

## SQL Exercise

- Solution is inside `graph` folder.
- Create Postgres Container ```docker run -d -e POSTGRES_PASSWORD=postgres -e POSTGRES_USER=postgres -e POSTGRES_DB=postgres --network host postgres:alpine```
- Connect to db: ```pgcli postgres://postgres:postgres@localhost:5432/postgres```
- Create Schema and entries ```\i ~/path/animated-googles/graph/create.sql```
- Run select queries ```\i ~/path/animated-googles/graph/select.sql```
- Drop everything ```\i ~/path/animated-googles/graph/drop.sql```

## Algo Exercise

- Solution is inside `algo` folder.
- To directly run solution, ```python3 main.py```
- Create virtual environment ```python3 -m venv .venv```
- Install dependencies ```pip install -r algo/requirements.txt```
- To check plot, and run code in jupyterlab, ```jupyterlab```
