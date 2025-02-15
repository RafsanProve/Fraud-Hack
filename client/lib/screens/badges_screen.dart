import 'package:flutter/material.dart';

class BadgesScreen extends StatelessWidget {
  const BadgesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> users = [
      {"name": "John Doe", "badge": "Gold 🥇", "color": Colors.amber.shade700},
      {"name": "Alice Smith", "badge": "Silver 🥈", "color": Colors.grey.shade400},
      {"name": "Bob Johnson", "badge": "Bronze 🥉", "color": Colors.brown.shade600},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Badges")),
      backgroundColor: Colors.lightGreen[200],
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Card(
            color: users[index]["color"],  // Dynamic color based on the badge
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              leading: Text(users[index]["badge"], style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)),
              title: Text(
                users[index]["name"],
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}
