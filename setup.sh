#!/bin/bash
# setup.sh - Optimized for running inside the dev container via postCreateCommand

echo "🔧 Running post-container setup..."

# Create .env with defaults if it doesn't exist
if [ ! -f ".env" ]; then
  echo "📝 .env file not found. Creating default .env..."
  # Using printf for better compatibility and to avoid issues with EOF markers
  printf '%s\n' \
    "# Database configuration (Change for production!)" \
    "DATABASE_URL=postgresql://postgres:postgres@db:5432/price_tracker" \
    "# Scraper configuration" \
    "SCRAPE_INTERVAL_HOURS=6" \
    "MAX_CONCURRENT_SCRAPES=2" > .env
  echo "✅ Default .env created. Remember to configure secrets appropriately for production."
else
  echo "✅ .env file already exists. Assuming it's configured."
fi

echo "✅ Post-container setup complete."
echo "▶️  Run the app (inside container) with:"
echo "    uvicorn app.main:app --host 0.0.0.0 --port 8000 --reload"