from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI(
    title="Price Tracker API",
    description="API for tracking product prices across websites",
    version="0.1.0",
)

# Configure CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # For development - restrict in production
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Optional: Import and include API routes if they exist
try:
    from app.api import router as api_router

    app.include_router(api_router, prefix="/api")
except ImportError:
    pass

# Optional: Mount static files if directory exists
try:
    from fastapi.staticfiles import StaticFiles

    app.mount("/static", StaticFiles(directory="static"), name="static")
except (ImportError, RuntimeError):
    pass


@app.get("/")
async def root():
    """Root endpoint for health checks and basic info"""
    return {
        "status": "online",
        "message": "Price Tracker API is running",
        "docs": "/docs",
    }


if __name__ == "__main__":
    import uvicorn

    uvicorn.run("app.main:app", host="0.0.0.0", port=8000, reload=True)
