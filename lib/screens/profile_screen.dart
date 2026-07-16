import 'package:flutter/material.dart';
import 'login.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          const SizedBox(height: 12),
          Container(
            height: 72, width: 72,
            decoration: BoxDecoration(color: const Color(0xffD7FF47), borderRadius: BorderRadius.circular(18)),
            child: const Icon(Icons.person, size: 36, color: Colors.black),
          ),
          const SizedBox(height: 14),
          const Text("James Anderson", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)),
          const SizedBox(height: 4),
          const Text("james.anderson@email.com", style: TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 20),
          Row(children: [
            _stat("24", "Runs"),
            _stat("85.6", "KM"),
            _stat("5:30", "Pace"),
          ]),
          const SizedBox(height: 28),
          _menu(Icons.person_outline, "Edit Profile"),
          _menu(Icons.notifications_outlined, "Notifications"),
          _menu(Icons.shield_outlined, "Privacy & Security"),
          _menu(Icons.watch, "Connected Devices"),
          _menu(Icons.stars_outlined, "Achievements"),
          _menu(Icons.info_outline, "About"),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity, height: 44,
            child: OutlinedButton.icon(
              onPressed: () => Navigator.pushAndRemoveUntil(
                context, MaterialPageRoute(builder: (_) => const LoginScreen()), (route) => false,
              ),
              icon: const Icon(Icons.logout, color: Colors.redAccent, size: 18),
              label: const Text("Logout", style: TextStyle(color: Colors.redAccent, fontSize: 13)),
              style: OutlinedButton.styleFrom(
                side: const BorderSide(color: Colors.redAccent),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
          ),
          const SizedBox(height: 32),
        ]),
      ),
    );
  }

  static Widget _stat(String value, String label) {
    return Expanded(
      child: Column(children: [
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w300)),
        const SizedBox(height: 4),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 11)),
      ]),
    );
  }

  static Widget _menu(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(color: const Color(0xff1A1D29), borderRadius: BorderRadius.circular(12)),
      child: Row(children: [
        Icon(icon, color: const Color(0xffD7FF47), size: 20),
        const SizedBox(width: 12),
        Expanded(child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 13))),
        const Icon(Icons.chevron_right, color: Colors.grey, size: 18),
      ]),
    );
  }
}
