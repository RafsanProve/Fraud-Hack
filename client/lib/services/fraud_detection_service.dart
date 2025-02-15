import 'dart:math';

class FraudDetectionService {
  List<Map<String, dynamic>> userTransactions = [];

  bool detectFraud({
    required double transactionAmount,
    required String userIP,
    required String deviceID,
    required List<double> pastTransactions,
    required List<String> pastIPs,
  }) {
    bool isFraud = false;

    // Rule 1: Check if transaction is significantly higher than user's average spending
    double avgSpending = pastTransactions.isEmpty
        ? 0
        : pastTransactions.reduce((a, b) => a + b) / pastTransactions.length;

    if (transactionAmount > avgSpending * 3) {
      print("⚠️ Fraud Alert: Unusual transaction amount detected!");
      isFraud = true;
    }

    // Rule 2: Frequent IP changes
    if (pastIPs.length >= 3 && !pastIPs.contains(userIP)) {
      print("⚠️ Fraud Alert: Multiple IP changes detected!");
      isFraud = true;
    }

    // Rule 3: Multiple high-value transactions in a short time
    if (pastTransactions.length >= 3 &&
        pastTransactions.skip(pastTransactions.length - 3).every((amt) => amt > 1000)) {
      print("⚠️ Fraud Alert: Multiple high-value transactions detected!");
      isFraud = true;
    }

    return isFraud;
  }

  void addTransaction(double amount, String userIP, String deviceID) {
    userTransactions.add({
      "amount": amount,
      "ip": userIP,
      "deviceID": deviceID,
      "timestamp": DateTime.now(),
    });
  }
}
