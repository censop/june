import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:june/main.dart';

class AgentMessage {
  final String role; // 'user' or 'assistant'
  final String content;
  AgentMessage({required this.role, required this.content});

  Map<String, dynamic> toJson() => {'role': role, 'content': content};
}

class AgentService {
  static const _functionUrl =
      'https://dbfmxblmzlelgixekokn.supabase.co/functions/v1/agent';

  static Future<String> chat(List<AgentMessage> messages) async {
    final session = supabase.auth.currentSession;
    if (session == null) throw Exception('User not authenticated');

    final response = await http.post(
      Uri.parse(_functionUrl),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${session.accessToken}',
      },
      body: jsonEncode({
        'messages': messages.map((m) => m.toJson()).toList(),
      }),
    );

    if (response.statusCode != 200) {
      throw Exception('Agent error: ${response.body}');
    }

    final data = jsonDecode(response.body);
    return data['reply'] as String;
  }
}