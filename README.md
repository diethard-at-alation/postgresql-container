# postgresql-container


Use this PostgreSQL container to test e.g. QLI, which currently cannot be enabled for AWS RDS PostgreSQL clusters.

To start the container, use the following docker-compose definition:

```
docker-compose -f docker-compose-postgresql.yaml up -d
```

Run this from within the repo folder.

If there are any errors, you can see them via:

```
docker logs -f postgresql-container-db-1
```

If you want to check the container:

```
docker exec -it postgresql-container-db-1 /bin/bash
psql -U postgres test
```

To stop the service:

```
docker-compose -f docker-compose-postgresql.yaml stop
```

To start the service again:

```
docker-compose -f docker-compose-postgresql.yaml start
```

