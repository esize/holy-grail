# Docker Image for Canvas LMS

This docker image of Canvas LMS builds the application in one single container. It still relies on external services for database and caching.

You can run multiple instances of this container for web and bg worker tasks.

## Build

```bash
docker-compose build
```

## Install

Update `docker-compose.yml` with correct ENV_VARS

### DB Intial setup

```bash
docker-compose up -d postgres redis
docker-compose run --rm db_initial
```

### Run with canvas

```bash
docker-compose up -d postgres redis web jobs
```

### Reset Encryption Key

```bash
docker-compose run --rm reset_encryption_key
```

### SSH to container

```bash
docker-compose run --rm bash
```

