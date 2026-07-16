import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Progress", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500)),
            const SizedBox(height: 4),
            const Text("Track your improvements", style: TextStyle(color: Colors.grey, fontSize: 12)),
            const SizedBox(height: 20),
            Row(children: [
              Expanded(child: _card("Total Distance", "85.6 km", Icons.straighten, const Color(0xffD7FF47))),
              const SizedBox(width: 8),
              Expanded(child: _card("Total Runs", "24", Icons.directions_run, Colors.cyanAccent)),
            ]),
            const SizedBox(height: 8),
            Row(children: [
              Expanded(child: _card("Avg Pace", "5:30 /km", Icons.speed, Colors.orangeAccent)),
              const SizedBox(width: 8),
              Expanded(child: _card("Calories", "8,420 kcal", Icons.local_fire_department, Colors.redAccent)),
            ]),
            const SizedBox(height: 24),
            const Text("This Week", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: const Color(0xff1A1D29), borderRadius: BorderRadius.circular(14)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(7, (i) {
                  final days = ["M", "T", "W", "T", "F", "S", "S"];
                  final values = [3.2, 0.0, 5.1, 4.5, 0.0, 6.8, 2.1];
                  final active = values[i] > 0;
                  return Column(children: [
                    Container(
                      height: 20 + values[i] * 8, width: 22,
                      decoration: BoxDecoration(
                        color: active ? const Color(0xffD7FF47) : const Color(0xff2A2D3A),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      alignment: Alignment.topCenter,
                      padding: const EdgeInsets.only(top: 2),
                      child: active
                          ? Text(values[i].toStringAsFixed(1),
                              style: const TextStyle(color: Colors.black, fontSize: 7))
                          : null,
                    ),
                    const SizedBox(height: 6),
                    Text(days[i], style: const TextStyle(color: Colors.grey, fontSize: 10)),
                  ]);
                }),
              ),
            ),
            const SizedBox(height: 24),
            const Text("Achievements", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
            const SizedBox(height: 14),
            _badge(Icons.emoji_events, "First 5K", "Completed your first 5K run", true),
            _badge(Icons.star, "Week Warrior", "Ran 5 days in a week", true),
            _badge(Icons.speed, "Speed Demon", "Sub-5 min/km pace", false),
            _badge(Icons.location_on, "Explorer", "Run in 5 different locations", false),
            const SizedBox(height: 24),
            const Text("Monthly Overview", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: const Color(0xff1A1D29), borderRadius: BorderRadius.circular(14)),
              child: Column(children: [
                _overviewRow("Distance", "85.6 km", "72.3 km", "+18%"),
                const Divider(color: Color(0xff2A2D3A), height: 24),
                _overviewRow("Duration", "12.4 hrs", "10.1 hrs", "+23%"),
                const Divider(color: Color(0xff2A2D3A), height: 24),
                _overviewRow("Runs", "24", "21", "+14%"),
              ]),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  static Widget _card(String title, String value, IconData icon, Color color) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(color: const Color(0xff1A1D29), borderRadius: BorderRadius.circular(12)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Icon(icon, color: color, size: 22),
        const SizedBox(height: 10),
        Text(value, style: const TextStyle(color: Colors.white, fontSize: 18)),
        const SizedBox(height: 2),
        Text(title, style: const TextStyle(color: Colors.grey, fontSize: 10)),
      ]),
    );
  }

  static Widget _badge(IconData icon, String title, String desc, bool unlocked) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xff1A1D29).withValues(alpha: unlocked ? 1 : 0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(children: [
        Icon(icon, color: unlocked ? const Color(0xffD7FF47) : Colors.grey, size: 22),
        const SizedBox(width: 12),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(title, style: TextStyle(color: unlocked ? Colors.white : Colors.grey, fontSize: 12)),
            Text(desc, style: const TextStyle(color: Colors.grey, fontSize: 10)),
          ]),
        ),
        Icon(unlocked ? Icons.check_circle : Icons.lock, color: unlocked ? const Color(0xffD7FF47) : Colors.grey, size: 18),
      ]),
    );
  }

  static Widget _overviewRow(String label, String current, String previous, String change) {
    final isPositive = change.startsWith("+");
    return Row(children: [
      Expanded(flex: 2, child: Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12))),
      Expanded(
        flex: 2,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(current, style: const TextStyle(color: Colors.white, fontSize: 12)),
          Text("Last: $previous", style: const TextStyle(color: Colors.grey, fontSize: 10)),
        ]),
      ),
      Container(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
        decoration: BoxDecoration(
          color: isPositive ? const Color(0xffD7FF47).withValues(alpha: 0.15) : Colors.red.withValues(alpha: 0.15),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(change, style: TextStyle(color: isPositive ? const Color(0xffD7FF47) : Colors.redAccent, fontSize: 10)),
      ),
    ]);
  }
}
