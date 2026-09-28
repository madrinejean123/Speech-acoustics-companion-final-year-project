from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from app.api import predict, synthesize
from app.core.config import get_settings

settings = get_settings()

app = FastAPI(title=settings.app_name)

app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],
    allow_methods=["*"],
    allow_headers=["*"],
)

app.include_router(predict.router)
app.include_router(synthesize.router)


@app.get("/health")
def health() -> dict[str, str]:
    return {"status": "ok"}
