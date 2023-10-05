import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class MessageSender {
  // final String apiUrl = 'http://circulator.p-e.kr:8000/connection/control/';
  // final String apiUrl = 'http://127.0.0.1:8000/connection/control/';
  final String apiUrl = 'http://192.168.88.87:8000/connection/control/';

  Future<void> writeJsonToFile(Map<String, dynamic> data) async {
    // Request storage permission
    final status = await Permission.storage.request();

    if (status.isGranted) {
      try {
        final directory = await getApplicationDocumentsDirectory();
        final file =
            File('${directory.path}/waypoints.json'); // Correct file path

        // Serialize to json
        String jsonString = jsonEncode(data);

        // Create the file if it doesn't exist
        if (!await file.exists()) {
          await file.create(recursive: true);
        }

        // Write the file.
        await file.writeAsString(jsonString).then((File file) {
          print('File written successfully');
        });
      } catch (e) {
        print('Error writing JSON to file: $e');
      }
    } else {
      print('Storage permission denied');
    }
  }

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
      String responseBody = response.body;
      Map<String, dynamic> data = json.decode(responseBody);
      String status = data['status'];
      if (status == "waypoints") {
        print('Writing Json to file');
        await writeJsonToFile(data);
      }

      print(response.body);

      if (response.statusCode == 200) {
        print('Message sent successfully');
        // print(response);
      } else {
        print('Failed to send message. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error sending message: $e');
    }
  }
}
