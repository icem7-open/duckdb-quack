#!/bin/bash
set -e

DB_PATH=":memory:"
echo "=== DuckDB Quack Server (bucket) ==="

if [ -z "$QUACK_TOKEN" ]; then
    echo "[ERREUR] QUACK_TOKEN non défini."
    exit 1
fi


echo "[1/2] Base trouvée : $DB_PATH"
echo "[2/2] Démarrage nginx + Quack..."

nginx

(
  echo "LOAD quack; CALL quack_serve('quack:0.0.0.0:9495', allow_other_hostname => true, token => '${QUACK_TOKEN}');"
  sleep infinity
) | exec duckdb "$DB_PATH"
