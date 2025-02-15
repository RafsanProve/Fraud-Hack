import 'package:flutter/material.dart';

class MailVerificationPage extends StatelessWidget {
  const MailVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[200],
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Mail Verification", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: "Poppins")),
              SizedBox(height: 30),
              Image.asset("assets/email_verification.png", height: 120, width: 120),
              SizedBox(height: 20),
              Text(
                "A mail is sent to abc@gmail.com.\nPlease check it.\nIf you have not received the mail, click resend.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500, fontFamily: "Poppins"),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade900,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  // TODO: Implement resend logic
                },
                child: Text("Resend", style: TextStyle(fontSize: 18, color: Colors.lightGreen[200])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}