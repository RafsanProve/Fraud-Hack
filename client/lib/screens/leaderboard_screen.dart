import 'package:flutter/material.dart';

class LeaderboardScreen extends StatelessWidget {
  const LeaderboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> users = [
      {"name": "John Doe", "score": 95},
      {"name": "Alice Smith", "score": 90},
      {"name": "Bob Johnson", "score": 88},
      {"name": "Charlie Brown", "score": 85},
      {"name": "David Williams", "score": 80},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Leaderboard")),
      backgroundColor: Colors.lightGreen[200],
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: users.length,
        itemBuilder: (context, index) {
          return Card(
            color: Colors.white,
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.green.shade700,
                child: Text("#${index + 1}", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
              title: Text(users[index]["name"]!, style: const TextStyle(fontWeight: FontWeight.bold)),
              trailing: Text("Score: ${users[index]["score"]}", style: const TextStyle(fontSize: 16)),
            ),
          );
        },
      ),
    );
  }
}
