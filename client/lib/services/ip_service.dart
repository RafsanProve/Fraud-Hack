import 'package:http/http.dart' as http;
import 'dart:convert';

class IpService {
  Future<String> getIpAddress() async {
    try {
      final response = await http.get(Uri.parse('https://api64.ipify.org?format=json'));

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        return data['ip'];
      } else {
        throw Exception('Failed to get IP address');
      }
    } catch (e) {
      return "Error: $e";
    }
  }
}
