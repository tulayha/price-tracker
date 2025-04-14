# Price Tracker (WIP)

FastAPI backend for tracking product prices from Pakistani e-commerce sites like Daraz, PriceOye, and Shophive. Built for scalability, scraping automation, and future alerting.

## Features (Planned)

- Scrape prices from supported sites (via Playwright)
- Store historical price data
- Expose APIs to fetch price history
- Schedule periodic scraping
- Notify users on price drops

## Tech Stack

- FastAPI, SQLAlchemy, Alembic, Pydantic
- Playwright for scraping
- Docker + Dev Containers
- PostgreSQL (in-container), SQLite (fallback)

## Setup (Dev)

### Via Dev Container (Recommended)

1. Install Docker + VS Code (with Dev Containers extension)
2. Open the project in VS Code
3. Select "Reopen in Container"
4. Run the API:

   ```bash
   uvicorn main:app --reload
   ```

### Local Setup (Alt)

```bash
setup.bat
venv\Scripts\activate
uvicorn main:app --reload
```

## Project Structure (WIP)

```
price_tracker/
├── app/
│   ├── api/         # Routes
│   ├── models/      # DB models
│   ├── scrapers/    # Site-specific scraping logic
│   └── core/        # Config, logging
├── tests/
├── .devcontainer/
├── requirements.txt
├── setup.bat
└── README.md
```

git init
git add .
git commit -m "Initial commit with devcontainer and setup"
git branch -M main
git remote add origin https://github.com/tulayha/price-tracker.git
git push -u origin main