#!/bin/bash
# setup.sh

echo "🔧 Setting up Price Tracker dev environment..."

# Check Python version (need 3.7+)
python_version=$(python --version 2>&1)
if ! [[ $python_version =~ 3\.([7-9]|1[0-9]) ]]; then
  echo "❌ Error: Python 3.7 or higher is required."
  echo "Current version: $python_version"
  exit 1
fi

# Install dependencies
if [ -f "requirements.txt" ]; then
  echo "📦 Installing dependencies from requirements.txt..."
  pip install -r requirements.txt
else
  echo "⚠️ requirements.txt not found, installing basic dependencies..."
  pip install fastapi uvicorn sqlalchemy psycopg2-binary python-dotenv playwright alembic pytest
fi

# Install Playwright browsers
echo "🌐 Installing Playwright browsers..."
playwright install

# Create .env if missing
if [ ! -f ".env" ]; then
  echo "📝 Creating .env file..."
  cat > .env << EOF
# Database configuration
DATABASE_URL=postgresql://postgres:postgres@db:5432/price_tracker
# Scraper configuration
SCRAPE_INTERVAL_HOURS=6
MAX_CONCURRENT_SCRAPES=2
EOF
else
  echo "✅ .env file already exists."
fi

# Create project structure if not exists
if [ ! -d "app" ]; then
  echo "📁 Creating project structure..."
  mkdir -p app/api/endpoints app/core app/models app/scrapers app/utils static/css static/js tests
fi

echo "✅ Setup complete."
echo "▶️  Run the app with:"
echo "    uvicorn app.main:app --reload"