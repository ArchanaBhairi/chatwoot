#!/bin/sh
set -e

echo "==> Waiting for DB to be ready..."
until bundle exec rails runner "ActiveRecord::Base.connection.execute('SELECT 1')" 2>/dev/null; do
  echo "DB not ready, retrying in 3s..."
  sleep 3
done

echo "==> Running DB migrations..."
bundle exec rails db:chatwoot_prepare 2>/dev/null || true
bundle exec rails db:migrate 2>/dev/null || true

echo "==> Starting Sidekiq in background..."
bundle exec sidekiq -C config/sidekiq.yml &

echo "==> Starting Rails on port ${PORT:-10000}..."
exec bundle exec rails server -b 0.0.0.0 -p ${PORT:-10000}
