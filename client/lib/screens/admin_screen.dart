import 'package:flutter/material.dart';
import 'package:hackathon07/screens/badges_screen.dart';
import 'package:hackathon07/screens/leaderboard_screen.dart';
import 'package:hackathon07/screens/revenue_profit_screen.dart';
import 'user_list_screen.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double systemRevenue = 10000.00;
    double profitLoss = 2500.00;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Dashboard"),
        backgroundColor: Colors.green.shade900,
      ),
      backgroundColor: Colors.lightGreen[200],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),

          // Revenue and Profit/Loss Cards
          _buildSummaryCard("System Revenue:", systemRevenue, Colors.green.shade900),
          _buildSummaryCard("Net Profit/Loss:", profitLoss, profitLoss >= 0 ? Colors.green : Colors.red),

          const SizedBox(height: 20),

          // Feature Grid with Labels
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                children: [
                  _buildFeatureButton(
                    icon: "assets/icons/user_list.png",
                    label: "User List",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const UserListScreen()),
                      );
                    },
                  ),
                  _buildFeatureButton(
                    icon: "assets/icons/finance.png",
                    label: "Revenue and Profit Overview",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const RevenueProfitScreen()),
                      );
                    },
                  ),
                  _buildFeatureButton(
                    icon: "assets/icons/award.png",
                    label: "Badges",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BadgesScreen()),
                      );
                    },
                  ),
                  _buildFeatureButton(
                    icon: "assets/icons/trophy.png",
                    label: "Leaderboard",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const LeaderboardScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper function to create summary cards
  Widget _buildSummaryCard(String title, double amount, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
            Text("\$${amount.toStringAsFixed(2)}", style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  // Helper function to create feature buttons with labels
  Widget _buildFeatureButton({required String icon, required String label, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.green.shade900,
              borderRadius: BorderRadius.circular(12),
            ),
            padding: const EdgeInsets.all(20.0),
            child: Image.asset(icon, fit: BoxFit.contain),
          ),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
