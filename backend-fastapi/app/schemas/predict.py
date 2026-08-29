from pydantic import BaseModel, Field


class PredictRequest(BaseModel):
    text: str


class Guess(BaseModel):
    text: str
    confidence: float = Field(..., ge=0.0, le=1.0)


class PredictResponse(BaseModel):
    guesses: list[Guess]
