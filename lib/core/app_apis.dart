import 'dart:convert';
import 'package:http/http.dart' as http;

const String openAiKey = "";

const String baseURL = "https://api.openai.com/v1";

String endPoint(String endPoint) => "$baseURL/$endPoint";

Map<String, String> headerBearerOption(String token) => {
      "Content-Type": "application/json",
      'Authorization': 'Bearer $token',
    };

enum ApiState { loading, success, error, notFound }

class ChatGptApi {
  Future<String> getMessageFromChatGPT(String message) async {
    try {
      http.Response response =
          await http.post(Uri.parse("https://api.openai.com/v1/completions"),
              headers: {
                "Authorization": "Bearer $openAiKey",
                'Content-Type': 'application/json',
              },
              body: jsonEncode({
                "model": "text-davinci-003",
                "prompt": message,
                "temperature": 0.9,
                "max_tokens": 4000,
                "top_p": 1,
                "frequency_penalty": 0,
                "presence_penalty": 0.6,
                "stop": [" Human:", " AI:"]
              }));
      return (jsonDecode(response.body)["choices"][0]["text"] as String)
          .replaceFirst("\n", "")
          .replaceFirst("\n", "");
    } catch (e) {
      return "";
    }
  }
}
