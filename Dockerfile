# SQL Server 2022 with Full-Text Search
# Based on https://gist.github.com/pbthorste/2dd302939ad84ab26932e9e18b7428d8
FROM mcr.microsoft.com/mssql/server:2022-latest

USER root

# Add SQL Server 2022 repo (FTS package lives there, not in the base Ubuntu repos)
RUN apt-get update && \
    apt-get install -y curl apt-transport-https gnupg && \
    curl -fsSL https://packages.microsoft.com/keys/microsoft.asc | apt-key add - && \
    curl -fsSL https://packages.microsoft.com/config/ubuntu/22.04/mssql-server-2022.list \
      -o /etc/apt/sources.list.d/mssql-server-2022.list && \
    apt-get update && \
    apt-get install -y mssql-server-fts && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER mssql
