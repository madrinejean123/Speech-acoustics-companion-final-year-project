from fastapi.testclient import TestClient

from app.main import app

client = TestClient(app)


def test_synthesize_returns_wav_bytes():
    response = client.post(
        "/synthesize", json={"text": "bank", "voice_id": "demo-voice"}
    )
    assert response.status_code == 200
    assert response.headers["content-type"] == "audio/wav"
    assert response.content.startswith(b"RIFF")
