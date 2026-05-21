#!/bin/sh
set -e

echo "==> Running DB migrations..."
bundle exec rails db:chatwoot_prepare || bundle exec rails db:migrate

echo "==> Starting Sidekiq..."
bundle exec sidekiq -C config/sidekiq.yml &

echo "==> Starting Rails on port ${PORT:-10000}..."
exec bundle exec rails server -b 0.0.0.0 -p ${PORT:-10000}
