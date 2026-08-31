enum AssistMode { askMeFirst, speakWhenSure, onlyWhenAsked }

class UserSettings {
  const UserSettings({
    this.assistMode = AssistMode.askMeFirst,
    this.language = 'English',
    this.offlineOnly = true,
    this.confidenceThreshold = 0.9,
  });

  final AssistMode assistMode;
  final String language;
  final bool offlineOnly;
  final double confidenceThreshold;

  UserSettings copyWith({
    AssistMode? assistMode,
    String? language,
    bool? offlineOnly,
    double? confidenceThreshold,
  }) {
    return UserSettings(
      assistMode: assistMode ?? this.assistMode,
      language: language ?? this.language,
      offlineOnly: offlineOnly ?? this.offlineOnly,
      confidenceThreshold: confidenceThreshold ?? this.confidenceThreshold,
    );
  }
}
