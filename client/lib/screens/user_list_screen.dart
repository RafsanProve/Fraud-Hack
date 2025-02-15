import 'package:flutter/material.dart';

class UserListScreen extends StatelessWidget {
  const UserListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> users = [
      {"name": "User 1", "transactions": 15, "spending": 1500.0, "ip": "192.168.1.1"},
      {"name": "User 2", "transactions": 8, "spending": 1200.0, "ip": "192.168.1.2"},
      {"name": "User 3", "transactions": 20, "spending": 2300.0, "ip": "192.168.1.3"},
      {"name": "User 4", "transactions": 5, "spending": 800.0, "ip": "192.168.1.4"},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("User List"),
        backgroundColor: Colors.green.shade900,
      ),
      backgroundColor: Colors.lightGreen[200],
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          var user = users[index];

          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(15),
              title: Text(user["name"], style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Total Transactions: ${user["transactions"]}"),
                  Text("Total Spending: \$${user["spending"].toStringAsFixed(2)}"),
                  Text("IP Address: ${user["ip"]}"),
                ],
              ),
              trailing: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red.shade800,
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                ),
                onPressed: () {
                  // Implement Ban Logic
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Text("Freeze User"),
                      content: Text("Are you sure you want to ban ${user["name"]}?"),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () {
                            // TODO: Implement actual banning logic
                            Navigator.pop(context);
                          },
                          child: const Text("Ban", style: TextStyle(color: Colors.red)),
                        ),
                      ],
                    ),
                  );
                },
                child: const Text("Freeze", style: TextStyle(color: Colors.white)),
              ),
            ),
          );
        },
      ),
    );
  }
}
