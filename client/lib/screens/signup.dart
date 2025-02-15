import 'package:flutter/material.dart';
import 'package:hackathon07/screens/mailVerifcation.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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
              Text(
                "Financial Hack",
                style: TextStyle(fontSize: 64, fontWeight: FontWeight.bold, fontFamily: "Italianno"),
              ),
              SizedBox(height: 20),
              buildTextField("Name"),
              buildTextField("Contact Number"),
              buildTextField("Address"),
              buildTextField("Mail"),
              buildTextField("Date of Birth"),
              buildTextField("Password", obscureText: true),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade900,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  // Navigate to Mail Verification Page after signing up
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MailVerificationPage()),
                  );
                },
                child: Text("Sign Up", style: TextStyle(fontSize: 18, color: Colors.lightGreen[200])),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String hint, {bool obscureText = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          filled: true,
          fillColor: Colors.white,
        ),
      ),
    );
  }
}