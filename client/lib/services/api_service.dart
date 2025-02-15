import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "http://127.0.0.1:5000"; // Change this to your server IP

  // User Authentication
  Future<Map<String, dynamic>> login(String phone, String password) async {
    print("Hello2");
    final response = await http.post(
      Uri.parse("$baseUrl/auth/login"),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"user_id": "B68i1NsNNvKYEy6G7CCm", "email": phone, "password": password}),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Login failed!");
    }
  }

  // Fetch User List (Admin Dashboard)
  Future<List<dynamic>> getUserList(String token) async {
    final response = await http.get(
      Uri.parse("$baseUrl/admin/users"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)["users"];
    } else {
      throw Exception("Failed to fetch users!");
    }
  }

  // Ban User (Admin Action)
  Future<bool> banUser(String userId, String token) async {
    final response = await http.post(
      Uri.parse("$baseUrl/admin/ban_user"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
      body: jsonEncode({"user_id": userId}),
    );

    return response.statusCode == 200;
  }

  // Fetch Transactions
  Future<List<dynamic>> getTransactions(String token) async {
    final response = await http.get(
      Uri.parse("$baseUrl/transactions"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)["transactions"];
    } else {
      throw Exception("Failed to fetch transactions!");
    }
  }

  // Fraud Detection Alerts
  Future<List<dynamic>> getFraudAlerts(String token) async {
    final response = await http.get(
      Uri.parse("$baseUrl/fraud/alerts"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      },
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body)["alerts"];
    } else {
      throw Exception("Failed to fetch fraud alerts!");
    }
  }
}
