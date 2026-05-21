FROM ubuntu:24.04

RUN apt-get update && apt-get install -y curl unzip nginx && rm -rf /var/lib/apt/lists/*

# DuckDB v1.5.3
RUN curl -L \
    https://github.com/duckdb/duckdb/releases/download/v1.5.3/duckdb_cli-linux-amd64.zip \
    -o /tmp/duckdb.zip \
    && unzip /tmp/duckdb.zip -d /usr/local/bin/ \
    && chmod +x /usr/local/bin/duckdb \
    && rm /tmp/duckdb.zip

# Pré-installation de l'extension quack
RUN duckdb -c "INSTALL quack;"

COPY nginx.conf /etc/nginx/nginx.conf
COPY start.sh /app/start.sh
RUN chmod +x /app/start.sh

EXPOSE 9494
CMD ["/app/start.sh"]
