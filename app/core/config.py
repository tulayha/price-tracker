import os
from typing import Any, Dict


class Settings:
    """Application settings"""

    # API settings
    API_TITLE: str = "Price Tracker API"
    API_VERSION: str = "0.1.0"

    # Database settings
    DATABASE_URL: str = os.getenv(
        "DATABASE_URL", "postgresql://postgres:postgres@db:5432/price_tracker"
    )

    # Scraper settings
    SCRAPE_INTERVAL_HOURS: int = int(os.getenv("SCRAPE_INTERVAL_HOURS", "6"))
    MAX_CONCURRENT_SCRAPES: int = int(os.getenv("MAX_CONCURRENT_SCRAPES", "2"))

    def dict(self) -> Dict[str, Any]:
        return {
            "API_TITLE": self.API_TITLE,
            "API_VERSION": self.API_VERSION,
            "DATABASE_URL": self.DATABASE_URL,
            "SCRAPE_INTERVAL_HOURS": self.SCRAPE_INTERVAL_HOURS,
            "MAX_CONCURRENT_SCRAPES": self.MAX_CONCURRENT_SCRAPES,
        }


# Create global settings instance
settings = Settings()
