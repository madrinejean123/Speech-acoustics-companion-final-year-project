from fastapi import APIRouter

from app.schemas.predict import Guess, PredictRequest, PredictResponse

router = APIRouter(prefix="/predict", tags=["predict"])


@router.post("", response_model=PredictResponse)
def predict(request: PredictRequest) -> PredictResponse:
    return PredictResponse(
        guesses=[
            Guess(text="bank", confidence=0.91),
            Guess(text="bar", confidence=0.05),
            Guess(text="bus stop", confidence=0.02),
        ]
    )
