abstract class SpeechService {
  Stream<String> get transcriptStream;
  Stream<String> get blockDetectedStream;

  Future<void> startListening();
  Future<void> stopListening();
}
