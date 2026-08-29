# Speech Companion - Backend

FastAPI service for model serving and session state. The mobile app is
offline-first, so this backend is for the dev/server-assisted path
(testing predictions against full-size models before they're optimized
to run on-device), see `frontend-flutter/lib/services/api/api_client.dart`.

## Structure

```
app/
  main.py            FastAPI app, router wiring, /health
  api/
    predict.py       POST /predict    - Stage 2 (LLM) word prediction
    synthesize.py    POST /synthesize - Stage 3 (TTS) voice synthesis
  core/config.py     Settings (env vars, prefixed SC_)
  schemas/           Pydantic request/response models
tests/               pytest + FastAPI TestClient
```

`predict` and `synthesize` currently return stub data (fixed guesses,
silent audio) so the mobile app has something real to call against
while the actual models are wired in.

## Running locally

```
cd backend-fastapi
python3 -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt
uvicorn app.main:app --reload
```

API docs at `http://localhost:8000/docs`.

## Testing

```
pytest
```

## Docker

```
docker build -t speech-companion-backend .
docker run -p 8000:8000 speech-companion-backend
```
