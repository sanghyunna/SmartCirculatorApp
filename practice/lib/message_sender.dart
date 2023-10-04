import 'dart:convert';
import 'package:http/http.dart' as http;

class MessageSender {
  // final String apiUrl = 'http://circulator.p-e.kr:8000/connection/control/';
  // final String apiUrl = 'http://127.0.0.1:8000/connection/control/';
  final String apiUrl = 'http://192.168.88.87:8000/connection/control/';

  Future<void> sendMessage(String message) async {
    try {
      Map<String, dynamic> messageData = {
        'message': message,
      };

      String jsonBody = json.encode(messageData);

      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonBody,
      );

      if (response.statusCode == 200) {
        print('Message sent successfully');
      } else {
        print('Failed to send message. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending message: $e');
    }
  }
}
