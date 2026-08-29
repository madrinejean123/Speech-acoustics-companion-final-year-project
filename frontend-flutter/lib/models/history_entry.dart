class HistoryEntry {
  const HistoryEntry({
    required this.timestamp,
    required this.context,
    required this.sentence,
    required this.completedWord,
    required this.latencyMs,
    this.flaggedWrong = false,
  });

  final DateTime timestamp;
  final String context;
  final String sentence;
  final String completedWord;
  final int latencyMs;
  final bool flaggedWrong;
}
