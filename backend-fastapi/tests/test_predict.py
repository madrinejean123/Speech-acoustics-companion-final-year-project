from fastapi.testclient import TestClient

from app.main import app

client = TestClient(app)


def test_predict_returns_ranked_guesses():
    response = client.post("/predict", json={"text": "so I'm going to the"})
    assert response.status_code == 200

    body = response.json()
    guesses = body["guesses"]
    assert len(guesses) > 0
    assert all(0.0 <= g["confidence"] <= 1.0 for g in guesses)
    # Ranked highest confidence first.
    assert guesses == sorted(guesses, key=lambda g: g["confidence"], reverse=True)
