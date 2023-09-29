import 'dart:convert';
import 'package:http/http.dart' as http;

class MessageSender {
  final String apiUrl = 'http://127.0.0.1:8000/connection/control';

  // Function to send the POST request.
  Future<void> sendMessage(String message) async {
    try {
      // Create a map containing the data you want to send as JSON.
      Map<String, dynamic> messageData = {
        'message': message,
        // Add more key-value pairs as needed.
      };

      // Convert the map to a JSON string.
      String jsonBody = json.encode(messageData);

      // Send the POST request.
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
        },
        body: jsonBody,
      );

      // Check the response status code.
      if (response.statusCode == 200) {
        // Request was successful.
        print('Message sent successfully');
      } else {
        // Request failed.
        print('Failed to send message. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle any exceptions that occur during the request.
      print('Error sending message: $e');
    }
  }
}
