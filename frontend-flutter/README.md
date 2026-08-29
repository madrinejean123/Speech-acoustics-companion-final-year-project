# Speech Companion - Frontend (Flutter)

Offline-first Flutter client for the speech companion pipeline: listens
through a stammering block, predicts the intended word, and speaks it
back in the user's own voice, only when the user asks.

## Structure

```
lib/
  main.dart, app.dart     entry point, MaterialApp + theme + router
  core/theme/              colors and ThemeData
  core/router/             go_router routes
  features/
    onboarding/screens/    Welcome & consent, Voice enrolment
    home/screens/          Ready
    listening/screens/     Listening, Stuck, Speaking
    history/screens/       History
    control/screens/       Control
  services/
    api/api_client.dart    HTTP client for the FastAPI backend
    speech/                ASR + block detection interface
    prediction/            word prediction interface
    tts/                   voice cloning + playback interface
  models/                  Guess, HistoryEntry, UserSettings
```

## Running

```
cd frontend-flutter
flutter pub get
flutter run
```

Point the app at a local backend during development:

```
flutter run --dart-define=API_BASE_URL=http://10.0.2.2:8000
```

## Testing

```
flutter test
```

## CI

`.github/workflows/flutter-ci.yml` runs `flutter analyze` + `flutter
test` on every push/PR touching `frontend-flutter/**`, then builds an
Android APK (`--split-per-abi`, one per ABI) and a web build, both
uploaded as artifacts.
