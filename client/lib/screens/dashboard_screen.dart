import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  double totalExpenses = 5000.00; // Example total expense value (fetch from database later)
  double totalIncome = 7500.00; // Example total income value (fetch from database later)
  double get netProfit => totalIncome - totalExpenses; // Calculate profit/loss
  String aiBudgetSuggestion = "Consider reducing entertainment expenses by 10%."; // Example AI suggestion

  List<String> fraudAlerts = [];

  // Sample transaction data (replace with database fetching)
  List<Map<String, dynamic>> transactions = [
    {"amount": 1500, "date": "12th Feb", "time": "10:00 AM"},
    {"amount": 200, "date": "13th Feb", "time": "02:00 AM"},
    {"amount": 3000, "date": "14th Feb", "time": "11:00 AM"},
    {"amount": 500, "date": "15th Feb", "time": "01:00 AM"},
    {"amount": 1200, "date": "16th Feb", "time": "02:00 AM"},
  ];

  @override
  void initState() {
    super.initState();
    detectFraudulentTransactions(transactions);
  }

  // Fraud detection function
  void detectFraudulentTransactions(List<Map<String, dynamic>> transactions) {
    fraudAlerts.clear();

    for (var transaction in transactions) {
      if (transaction["amount"] > 1000) {
        fraudAlerts.add("⚠️ Large transaction detected: \$${transaction['amount']} on ${transaction['date']}");
      }
      if (transaction["time"] == "02:00 AM") {
        fraudAlerts.add("⚠️ Unusual late-night transaction at ${transaction['time']}");
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Financial Dashboard")),
      backgroundColor: Colors.lightGreen[200],
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),

            // Total Expenses Display
            _buildSummaryCard("Total Expenses:", "\$${totalExpenses.toStringAsFixed(2)}", Colors.green.shade900),

            // Net Profit vs Loss Summary
            _buildSummaryCard("Net Profit/Loss:", "\$${netProfit.toStringAsFixed(2)}", netProfit >= 0 ? Colors.green : Colors.red),

            const SizedBox(height: 20),

            // Bar Chart for Transaction Overview
            SizedBox(
              height: 250,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: BarChart(
                  BarChartData(
                    barGroups: [
                      makeGroupData(0, 500, 200, 300),
                      makeGroupData(1, 300, 100, 250),
                      makeGroupData(2, 700, 400, 350),
                      makeGroupData(3, 600, 250, 450),
                      makeGroupData(4, 900, 500, 500),
                    ],
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, reservedSize: 40)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (double value, TitleMeta meta) {
                            const style = TextStyle(fontSize: 12, fontWeight: FontWeight.bold);
                            switch (value.toInt()) {
                              case 0: return const Text("Day 1", style: style);
                              case 1: return const Text("Day 2", style: style);
                              case 2: return const Text("Day 3", style: style);
                              case 3: return const Text("Day 4", style: style);
                              case 4: return const Text("Day 5", style: style);
                              default: return const Text("");
                            }
                          },
                          reservedSize: 38,
                        ),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    gridData: FlGridData(show: true),
                  ),
                ),
              ),
            ),

            // Legend for Bar Chart
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildLegendItem(Colors.blue, "Transactions"),
                  const SizedBox(width: 10),
                  buildLegendItem(Colors.red, "Withdrawals"),
                  const SizedBox(width: 10),
                  buildLegendItem(Colors.green, "Deposits"),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // AI Budget Suggestion Box
            _buildInfoBox("AI Suggestion: $aiBudgetSuggestion", Colors.orange, Icons.lightbulb),

            // Fraud Detection Notification
            if (fraudAlerts.isNotEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Container(
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 5, spreadRadius: 2),
                    ],
                  ),
                  child: Column(
                    children: fraudAlerts.map((alert) => Text(
                      alert,
                      style: const TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
                    )).toList(),
                  ),
                ),
              ),

            // Transaction List
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                height: 250,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: transactions.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("Transaction ${index + 1}"),
                      subtitle: Text("Amount: \$${transactions[index]["amount"]}"),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Helper function to create a summary card
  Widget _buildSummaryCard(String title, String value, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 5, spreadRadius: 2),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            Text(value, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  // Helper function to create an information box
  Widget _buildInfoBox(String message, Color color, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(width: 10),
            Expanded(child: Text(message, style: const TextStyle(color: Colors.white, fontSize: 16))),
          ],
        ),
      ),
    );
  }

  // Helper function to create a grouped bar chart dataset
  BarChartGroupData makeGroupData(int x, double transaction, double withdrawal, double deposit) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(toY: transaction, color: Colors.blue, width: 10),
        BarChartRodData(toY: withdrawal, color: Colors.red, width: 10),
        BarChartRodData(toY: deposit, color: Colors.green, width: 10),
      ],
    );
  }

  Widget buildLegendItem(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(4)),
        ),
        const SizedBox(width: 5),
        Text(text, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
      ],
    );
  }
}
