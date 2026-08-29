abstract class TtsService {
  Future<String> enrollVoice(List<String> recordedSentencePaths);
  Future<void> speak({required String text, required String voiceId});
  Future<void> stop();
}
