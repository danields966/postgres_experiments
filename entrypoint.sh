#!/bin/bash
set -e

for sql_file in /sql/task"$TASK"/*.sql; do
  echo "Running $sql_file..."
  psql --host=db --username="$PGUSER" --dbname="$PGDB" -f "$sql_file"
done
