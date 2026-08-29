import io
import wave

from fastapi import APIRouter, Response

from app.schemas.synthesize import SynthesizeRequest

router = APIRouter(prefix="/synthesize", tags=["synthesize"])


def _silent_wav_bytes(duration_seconds: float = 0.3, sample_rate: int = 16_000) -> bytes:
    buffer = io.BytesIO()
    with wave.open(buffer, "wb") as wav_file:
        wav_file.setnchannels(1)
        wav_file.setsampwidth(2)
        wav_file.setframerate(sample_rate)
        wav_file.writeframes(b"\x00\x00" * int(sample_rate * duration_seconds))
    return buffer.getvalue()


@router.post("")
def synthesize(request: SynthesizeRequest) -> Response:
    return Response(content=_silent_wav_bytes(), media_type="audio/wav")
