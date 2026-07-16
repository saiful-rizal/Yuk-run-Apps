import 'package:flutter/material.dart';
import 'login.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned.fill(child: Image.asset("assets/run.jpg", fit: BoxFit.cover)),
        Positioned.fill(
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter, end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(20, 0, 0, 0),
                  Color.fromARGB(120, 0, 0, 0),
                  Color.fromARGB(230, 0, 0, 0),
                ],
              ),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
            child: Column(children: [
              const Spacer(),
              const Text("Track your activity\nand get better life",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500, height: 1.3)),
              const SizedBox(height: 12),
              const Text("Run and monitor every step,\ndistance, and calories burned\nwith Yuk Run.",
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white70, fontSize: 13, height: 1.6)),
              const SizedBox(height: 28),
              SizedBox(
                width: double.infinity, height: 48,
                child: ElevatedButton(
                  onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen())),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFD8FF37), foregroundColor: Colors.black, elevation: 0,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                  ),
                  child: const Text("Start Journey", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
                ),
              ),
              const SizedBox(height: 18),
              GestureDetector(
                onTap: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const LoginScreen())),
                child: RichText(
                  text: const TextSpan(style: TextStyle(color: Colors.white70, fontSize: 12), children: [
                    TextSpan(text: "Already have an account? "),
                    TextSpan(text: "Login", style: TextStyle(color: Colors.white)),
                  ]),
                ),
              ),
              const SizedBox(height: 24),
            ]),
          ),
        ),
      ]),
    );
  }
}
