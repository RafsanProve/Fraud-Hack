import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'login.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[200],
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () => Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => const LoginScreen())),
                child: const Text("Skip", style: TextStyle(color: Colors.black, fontSize: 16)),
              ),
            ),
            Expanded(
              child: PageView(
                controller: _controller,
                onPageChanged: (index) {
                  setState(() => isLastPage = index == 3);
                },
                children: [
                  buildPage("Welcome to", "Financial Hack", "assets/OS1.png",
                      "Your Financial Companion"),
                  buildPage("Track your expenses", "", "assets/OS2.png",
                      "and income effortlessly."),
                  buildPage("Detect fraudulent transactions", "", "assets/OS3.png",
                      "in real-time."),
                  buildPage("Get AI-driven", "financial recommendations", "assets/OS4.png", ""),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SmoothPageIndicator(
                  controller: _controller,
                  count: 4,
                  effect: ExpandingDotsEffect(
                    dotWidth: 8,
                    dotHeight: 8,
                    activeDotColor: Colors.green.shade800,
                  ),
                ),
                SizedBox(width: 150),
                isLastPage
                    ? FloatingActionButton(
                  onPressed: () => Navigator.pushReplacement(
                      context, MaterialPageRoute(builder: (context) => const LoginScreen())),
                  backgroundColor: Colors.green.shade900,
                  child: const Icon(Icons.arrow_forward),
                )
                    : FloatingActionButton(
                  onPressed: () {
                    _controller.nextPage(
                        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
                  },
                  backgroundColor: Colors.green.shade900,
                  child: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget buildPage(String title, String subtitle, String imagePath, String description) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(title, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: "Poppins")),
        Text(subtitle,
            style: TextStyle(fontSize: 64, fontWeight: FontWeight.bold, fontFamily: "Italianno")),
        SizedBox(height: 20),
        Image.asset(imagePath, height: 120, width: 120),
        SizedBox(height: 20),
        Text(description,
            textAlign: TextAlign.center, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, fontFamily: "Poppins")),
      ],
    );
  }
}