# sqlserver-fts

SQL Server 2022 Docker image with Full-Text Search enabled.

The official `mcr.microsoft.com/mssql/server:2022-latest` image ships without
the `mssql-server-fts` package. This image adds it.

Image: [`rickythefox/sqlserver-fts`](https://hub.docker.com/r/rickythefox/sqlserver-fts)

## Usage

```bash
docker run -d \
  -e ACCEPT_EULA=Y \
  -e MSSQL_SA_PASSWORD=YourStrong!Passw0rd \
  -p 1433:1433 \
  --name sqlserver-fts \
  rickythefox/sqlserver-fts:latest
```

Verify FTS is installed:

```sql
SELECT SERVERPROPERTY('IsFullTextInstalled');  -- returns 1
```

## Build locally

```bash
docker build -t sqlserver-fts .
```

`linux/amd64` only — base image has no arm64 variant.

## CI

`.github/workflows/docker-publish.yml` builds and pushes to Docker Hub on:

- push to `main` → `latest`
- tag `v*` → semver tags
- pull request → build only, no push
- manual dispatch

Required repo config:

- Variable `DOCKERHUB_USERNAME`
- Variable `DOCKERHUB_IMAGE`
- Secret `DOCKERHUB_TOKEN` (Docker Hub PAT with `Read, Write` scope)

## Credit

Based on [pbthorste's gist](https://gist.github.com/pbthorste/2dd302939ad84ab26932e9e18b7428d8).
