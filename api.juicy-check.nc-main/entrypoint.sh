#!/bin/sh
set -e

echo "⏳ Waiting for database..."

# attendre que Postgres soit ready
until nc -z db 5432; do
  echo "Database not ready yet..."
  sleep 2
done

echo "✅ Database is up"

echo "🚀 Running migrations (drizzle-kit push)..."
npx drizzle-kit push

echo "✅ Migrations done"

echo "▶️ Starting application..."
exec node dist/main







