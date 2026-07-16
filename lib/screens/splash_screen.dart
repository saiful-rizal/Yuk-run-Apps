import 'dart:async';
import 'package:flutter/material.dart';
import 'onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 2500), () {
      if (!mounted) return;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const OnboardingScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Hero(
                  tag: "logo",
                  child: Image.asset("assets/logo.png", width: 72, height: 72, fit: BoxFit.contain),
                ),
                const SizedBox(height: 20),
                const Text("Yuk Run", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500, color: Colors.black, letterSpacing: 1)),
                const SizedBox(height: 6),
                const Text("Run Better, Live Healthier", textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 13, color: Colors.grey, height: 1.5)),
                const SizedBox(height: 36),
                const SizedBox(width: 22, height: 22,
                  child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFFD8FF37))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
