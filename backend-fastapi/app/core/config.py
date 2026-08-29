from functools import lru_cache

from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    model_config = SettingsConfigDict(env_file=".env", env_prefix="SC_")

    app_name: str = "Speech Companion API"
    host: str = "0.0.0.0"
    port: int = 8000

    prediction_model_dir: str | None = None
    tts_model_dir: str | None = None


@lru_cache
def get_settings() -> Settings:
    return Settings()
