from pydantic import BaseModel


class SynthesizeRequest(BaseModel):
    text: str
    voice_id: str
