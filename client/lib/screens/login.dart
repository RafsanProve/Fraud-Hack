import 'package:flutter/material.dart';
import 'package:hackathon07/screens/admin_screen.dart';
import 'package:hackathon07/screens/dashboard_screen.dart';
import 'package:hackathon07/screens/signup.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
              Text("Financial Hack",
                  style: TextStyle(fontSize: 64, fontWeight: FontWeight.bold, fontFamily: "Italianno")),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                    labelText: "Contact Number",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 15),
              TextField(
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade900,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdminScreen()),
                  );
                },
                child: Text("Sign In", style: TextStyle(fontSize: 18, color: Colors.lightGreen[200])),
              ),
              SizedBox(height: 50),
              Text("Don’t have an account? Then...", style: TextStyle(fontSize: 16)),
              SizedBox(height: 5),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade900,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUpPage()),
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
}