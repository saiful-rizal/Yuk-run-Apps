import 'package:flutter/material.dart';
import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscure = true;
  bool remember = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0F1118),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(height: 32),
            Center(
              child: Container(
                width: 64, height: 64,
                decoration: BoxDecoration(color: const Color(0xffD7FF47), borderRadius: BorderRadius.circular(16)),
                child: const Icon(Icons.directions_run, size: 34, color: Colors.black),
              ),
            ),
            const SizedBox(height: 36),
            const Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.w500)),
            const SizedBox(height: 6),
            const Text("Login to continue your journey", style: TextStyle(color: Colors.grey, fontSize: 13)),
            const SizedBox(height: 32),
            const Text("Email", style: TextStyle(color: Colors.white, fontSize: 12)),
            const SizedBox(height: 6),
            TextField(
              controller: emailController,
              style: const TextStyle(color: Colors.white, fontSize: 13),
              decoration: InputDecoration(
                hintText: "Enter your email",
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
                prefixIcon: const Icon(Icons.email_outlined, color: Colors.grey, size: 20),
                filled: true, fillColor: const Color(0xff1A1D29),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
            const SizedBox(height: 16),
            const Text("Password", style: TextStyle(color: Colors.white, fontSize: 12)),
            const SizedBox(height: 6),
            TextField(
              controller: passwordController,
              obscureText: obscure,
              style: const TextStyle(color: Colors.white, fontSize: 13),
              decoration: InputDecoration(
                hintText: "Enter your password",
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
                prefixIcon: const Icon(Icons.lock_outline, color: Colors.grey, size: 20),
                suffixIcon: IconButton(
                  icon: Icon(obscure ? Icons.visibility_off : Icons.visibility, color: Colors.grey, size: 20),
                  onPressed: () => setState(() => obscure = !obscure),
                ),
                filled: true, fillColor: const Color(0xff1A1D29),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
                contentPadding: const EdgeInsets.symmetric(vertical: 14),
              ),
            ),
            const SizedBox(height: 4),
            Row(children: [
              Checkbox(
                value: remember,
                activeColor: const Color(0xffD7FF47),
                onChanged: (v) => setState(() => remember = v!),
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              const Text("Remember Me", style: TextStyle(color: Colors.white, fontSize: 12)),
              const Spacer(),
              TextButton(
                onPressed: () {},
                child: const Text("Forgot Password?", style: TextStyle(color: Color(0xffD7FF47), fontSize: 12)),
              ),
            ]),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity, height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffD7FF47), foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const HomeScreen())),
                child: const Text("Login", style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500)),
              ),
            ),
            const SizedBox(height: 28),
            Row(children: const [
              Expanded(child: Divider(color: Colors.grey)),
              Padding(padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text("OR", style: TextStyle(color: Colors.grey, fontSize: 11))),
              Expanded(child: Divider(color: Colors.grey)),
            ]),
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity, height: 48,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.g_mobiledata, size: 22),
                label: const Text("Continue with Google", style: TextStyle(fontSize: 13)),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: const BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ),
            const SizedBox(height: 40),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Text("Don't have an account?", style: TextStyle(color: Colors.grey, fontSize: 12)),
              TextButton(
                onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Register coming soon!"), behavior: SnackBarBehavior.floating),
                ),
                child: const Text("Register", style: TextStyle(color: Color(0xffD7FF47), fontSize: 12)),
              ),
            ]),
          ]),
        ),
      ),
    );
  }
}
