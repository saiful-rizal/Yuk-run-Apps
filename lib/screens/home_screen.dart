import 'package:flutter/material.dart';
import 'community_screen.dart';
import 'activity_screen.dart';
import 'progress_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _index = 0;

  final List<Widget> _pages = const [
    _HomeTab(),
    CommunityScreen(),
    ActivityScreen(),
    ProgressScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff0F1118),
      body: _pages[_index],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff171A23),
        selectedItemColor: const Color(0xffD7FF47),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 9,
        unselectedFontSize: 9,
        currentIndex: _index,
        onTap: (i) => setState(() => _index = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_rounded, size: 20), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.people_alt_outlined, size: 20), label: "Community"),
          BottomNavigationBarItem(icon: Icon(Icons.play_circle_outline, size: 20), label: "Activity"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart, size: 20), label: "Progress"),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline, size: 20), label: "Profile"),
        ],
      ),
    );
  }
}

class _HomeTab extends StatelessWidget {
  const _HomeTab();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                  Text("Good Morning, James!", style: TextStyle(color: Colors.grey, fontSize: 11, fontWeight: FontWeight.w400)),
                  SizedBox(height: 4),
                  Text("Ready To Morning Run?", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w500)),
                ]),
              ),
              Container(
                height: 36, width: 36,
                decoration: BoxDecoration(color: const Color(0xffD7FF47), borderRadius: BorderRadius.circular(10)),
                child: const Icon(Icons.person, color: Colors.black, size: 20),
              ),
            ]),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: const Color(0xff1A1D29), borderRadius: BorderRadius.circular(14)),
              child: Column(children: [
                Row(children: [
                  Container(
                    height: 36, width: 36,
                    decoration: BoxDecoration(color: const Color(0xffD7FF47), borderRadius: BorderRadius.circular(8)),
                    child: const Icon(Icons.directions_run, color: Colors.black, size: 20),
                  ),
                  const SizedBox(width: 12),
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: const [
                    Text("Distance Increase 46%", style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500)),
                    SizedBox(height: 2),
                    Text("Yesterday : 2.8 KM", style: TextStyle(color: Colors.grey, fontSize: 11)),
                  ]),
                ]),
                const SizedBox(height: 16),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  _item("4.9", "KM", "Distance"),
                  _item("228", "KCAL", "Kilocalories"),
                  _item("90", "BPM", "Avg Heart Rate"),
                ]),
              ]),
            ),
            const SizedBox(height: 26),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
              Text("Featured Challenges", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
              Text("Show More", style: TextStyle(color: Colors.grey, fontSize: 11)),
            ]),
            const SizedBox(height: 14),
            Container(
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                image: const DecorationImage(image: AssetImage("assets/challenge.jpg"), fit: BoxFit.cover),
              ),
              child: Stack(children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    gradient: LinearGradient(
                      colors: [Colors.black.withValues(alpha: 0.7), Colors.transparent],
                      begin: Alignment.bottomLeft, end: Alignment.topRight,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(color: const Color(0xffD7FF47), borderRadius: BorderRadius.circular(10)),
                      child: const Text("Ends in 27 Days", style: TextStyle(fontSize: 9, fontWeight: FontWeight.w500)),
                    ),
                    const Spacer(),
                    const Text("Your Monthly\n30KM", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.w500)),
                    const SizedBox(height: 6),
                    const Text("40,572 Participants", style: TextStyle(color: Colors.white70, fontSize: 11)),
                  ]),
                ),
              ]),
            ),
            const SizedBox(height: 26),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: const [
              Text("Events", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
              Text("Show More", style: TextStyle(color: Colors.grey, fontSize: 11)),
            ]),
            const SizedBox(height: 14),
            SizedBox(
              height: 120,
              child: Row(children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Image.asset("assets/event1.jpg", fit: BoxFit.cover,
                      errorBuilder: (_, _, _) => Container(
                        color: const Color(0xff1A1D29),
                        child: const Center(child: Icon(Icons.event, color: Color(0xffD7FF47), size: 28)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(color: const Color(0xff1A1D29), borderRadius: BorderRadius.circular(14)),
                    child: const Center(child: Icon(Icons.event_rounded, color: Color(0xffD7FF47), size: 28)),
                  ),
                ),
              ]),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  static Widget _item(String value, String unit, String title) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      RichText(
        text: TextSpan(children: [
          TextSpan(text: value, style: const TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.w500)),
          TextSpan(text: unit, style: const TextStyle(color: Colors.grey, fontSize: 10)),
        ]),
      ),
      const SizedBox(height: 2),
      Text(title, style: const TextStyle(color: Colors.grey, fontSize: 10)),
    ]);
  }
}
