import 'package:flutter/material.dart';
import 'package:hackathon07/services/fraud_detection_service.dart';

class TransactionScreen extends StatefulWidget {
  @override
  _TransactionScreenState createState() => _TransactionScreenState();
}

class _TransactionScreenState extends State<TransactionScreen> {
  final FraudDetectionService fraudDetection = FraudDetectionService();

  String userIP = "192.168.1.5"; // Example IP (fetch dynamically)
  String deviceID = "Device_ABC"; // Example Device ID
  List<double> pastTransactions = [200.0, 150.0, 180.0, 1700.0]; // Fetch from DB
  List<String> pastIPs = ["192.168.1.1", "192.168.1.2", "192.168.1.3"]; // Fetch from DB

  final TextEditingController amountController = TextEditingController();

  void processTransaction() {
    double amount = double.tryParse(amountController.text) ?? 0.0;

    bool isFraud = fraudDetection.detectFraud(
      transactionAmount: amount,
      userIP: userIP,
      deviceID: deviceID,
      pastTransactions: pastTransactions,
      pastIPs: pastIPs,
    );

    if (isFraud) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text("Fraud Alert ⚠️"),
          content: Text("This transaction is flagged as suspicious and requires manual verification."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("OK"),
            ),
          ],
        ),
      );
    } else {
      // Proceed with transaction
      fraudDetection.addTransaction(amount, userIP, deviceID);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Transaction Successful ✅")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Make a Transaction")),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter Amount",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: processTransaction,
              child: Text("Submit Transaction"),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
