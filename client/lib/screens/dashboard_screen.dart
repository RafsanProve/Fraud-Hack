import 'package:flutter/material.dart';
import 'package:hackathon07/services/api_service.dart';

class DashboardScreen extends StatefulWidget {
  final String token;
  const DashboardScreen({super.key, required this.token});

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final ApiService apiService = ApiService();
  List<String> fraudAlerts = [];

  @override
  void initState() {
    super.initState();
    fetchFraudAlerts();
  }

  void fetchFraudAlerts() async {
    try {
      final alerts = await apiService.getFraudAlerts(widget.token);
      setState(() {
        fraudAlerts = alerts.cast<String>();
      });
    } catch (e) {
      print("Error fetching fraud alerts: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Financial Dashboard")),
      body: Column(
        children: [
          const SizedBox(height: 10),
          if (fraudAlerts.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 5, spreadRadius: 2)],
                ),
                child: Column(
                  children: fraudAlerts.map((alert) => Text(
                    alert,
                    style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                  )).toList(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
