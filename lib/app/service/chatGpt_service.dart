import 'dart:convert';
import 'package:http/http.dart' as http;

// class ChatGpt {
//   static const MethodChannel _channel =
//       const MethodChannel('chatgpt');

//   Future<String> generateText(String prompt) async {
//     final String response = await _channel.invokeMethod('generateText', {
//       'prompt': prompt,
//     });
//     return response;
//   }
// }

// 'https://api.openai.com/v1/engines/text-davinci-002/jobs',

class ChatGptService {
  static Future<String> generateText(String prompt) async {
    final response = await http.post(
      Uri(
          scheme: 'https',
          host: 'api.openai.com',
          path: '/v1/engines/text-davinci-002/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer <API_KEY>',
      },
      body: jsonEncode({
        'prompt': prompt,
        'max_tokens': 100,
        'temperature': 0.5,
      }),
    );
    final responseJson = jsonDecode(response.body);
    return responseJson['choices'][0]['text'];
  }
}
