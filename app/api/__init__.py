from fastapi import APIRouter

router: APIRouter = APIRouter()

# Import and include routers from endpoint modules
# Example: from app.api.endpoints.products import router as products_router
# router.include_router(products_router, prefix="/products", tags=["products"])
