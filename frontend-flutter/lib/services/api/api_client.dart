import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  ApiClient({http.Client? httpClient, String? baseUrl})
    : _http = httpClient ?? http.Client(),
      baseUrl = baseUrl ?? _defaultBaseUrl;

  final http.Client _http;
  final String baseUrl;

  // 10.0.2.2 is how the Android emulator reaches the host machine's localhost.
  static const _defaultBaseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'http://10.0.2.2:8000',
  );

  Uri _uri(String path) => Uri.parse('$baseUrl$path');

  Future<bool> ping() async {
    final response = await _http.get(_uri('/health'));
    return response.statusCode == 200;
  }

  Future<List<Map<String, dynamic>>> predictCompletion({
    required String precedingText,
  }) async {
    final response = await _http.post(
      _uri('/predict'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'text': precedingText}),
    );
    final body = jsonDecode(response.body) as Map<String, dynamic>;
    return List<Map<String, dynamic>>.from(body['guesses'] as List);
  }

  Future<List<int>> synthesizeSpeech({
    required String text,
    required String voiceId,
  }) async {
    final response = await _http.post(
      _uri('/synthesize'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'text': text, 'voice_id': voiceId}),
    );
    return response.bodyBytes;
  }

  void dispose() => _http.close();
}
