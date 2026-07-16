import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Community", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500)),
            const SizedBox(height: 4),
            const Text("Connect with fellow runners", style: TextStyle(color: Colors.grey, fontSize: 12)),
            const SizedBox(height: 20),
            Row(children: [
              Expanded(child: _leaderboardCard("1st", "Alex", "45.2 km", Colors.amber)),
              const SizedBox(width: 8),
              Expanded(child: _leaderboardCard("2nd", "Rina", "41.8 km", Colors.grey)),
              const SizedBox(width: 8),
              Expanded(child: _leaderboardCard("3rd", "Budi", "38.5 km", Colors.brown)),
            ]),
            const SizedBox(height: 24),
            const Text("Recent Activity", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
            const SizedBox(height: 12),
            _activityItem("Sarah", "Just completed a 5K run!", "2 min ago"),
            _activityItem("Dimas", "New personal best: 10K", "15 min ago"),
            _activityItem("Maya", "Joined the Monthly 30KM challenge", "1 hour ago"),
            _activityItem("Rizky", "Ran 8.2 km in 42 minutes", "3 hours ago"),
            const SizedBox(height: 24),
            const Text("Suggested Groups", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
            const SizedBox(height: 12),
            _groupCard(Icons.terrain, "Trail Runners", "1.2k members"),
            _groupCard(Icons.directions_run, "Morning Crew", "856 members"),
            _groupCard(Icons.speed, "Marathon Prep", "432 members"),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  static Widget _leaderboardCard(String rank, String name, String distance, Color color) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: const Color(0xff1A1D29), borderRadius: BorderRadius.circular(12)),
      child: Column(children: [
        Container(
          height: 32, width: 32,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: Center(child: Text(rank[0], style: const TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500))),
        ),
        const SizedBox(height: 8),
        Text(name, style: const TextStyle(color: Colors.white, fontSize: 12)),
        const SizedBox(height: 2),
        Text(distance, style: const TextStyle(color: Colors.grey, fontSize: 10)),
      ]),
    );
  }

  static Widget _activityItem(String name, String action, String time) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(children: [
        CircleAvatar(
          radius: 16,
          backgroundColor: const Color(0xffD7FF47),
          child: Text(name[0], style: const TextStyle(color: Colors.black, fontSize: 12, fontWeight: FontWeight.w500)),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                text: TextSpan(
                  style: const TextStyle(fontSize: 12),
                  children: [
                    TextSpan(text: name, style: const TextStyle(color: Colors.white)),
                    TextSpan(text: " $action", style: const TextStyle(color: Colors.grey)),
                  ],
                ),
              ),
              const SizedBox(height: 1),
              Text(time, style: const TextStyle(color: Colors.grey, fontSize: 10)),
            ],
          ),
        ),
      ]),
    );
  }

  static Widget _groupCard(IconData icon, String name, String members) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(color: const Color(0xff1A1D29), borderRadius: BorderRadius.circular(12)),
      child: Row(children: [
        Icon(icon, color: const Color(0xffD7FF47), size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: const TextStyle(color: Colors.white, fontSize: 12)),
              Text(members, style: const TextStyle(color: Colors.grey, fontSize: 10)),
            ],
          ),
        ),
        const Icon(Icons.chevron_right, color: Colors.grey, size: 16),
      ]),
    );
  }
}
