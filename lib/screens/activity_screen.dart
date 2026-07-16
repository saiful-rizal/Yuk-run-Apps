import 'dart:async';
import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  bool _isRunning = false, _isPaused = false;
  int _seconds = 0;
  Timer? _timer;

  @override
  void dispose() { _timer?.cancel(); super.dispose(); }

  void _toggleRun() {
    if (!_isRunning) {
      setState(() { _isRunning = true; _isPaused = false; });
      _timer = Timer.periodic(const Duration(seconds: 1), (_) => setState(() => _seconds++));
    } else if (_isPaused) {
      setState(() => _isPaused = false);
      _timer = Timer.periodic(const Duration(seconds: 1), (_) => setState(() => _seconds++));
    } else {
      _timer?.cancel();
      setState(() => _isPaused = true);
    }
  }

  void _stopRun() {
    _timer?.cancel();
    setState(() { _isRunning = false; _isPaused = false; _seconds = 0; });
  }

  String get _time {
    final h = (_seconds ~/ 3600).toString().padLeft(2, '0');
    final m = ((_seconds % 3600) ~/ 60).toString().padLeft(2, '0');
    final s = (_seconds % 60).toString().padLeft(2, '0');
    return "$h:$m:$s";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          const Text("Activity", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500)),
          const SizedBox(height: 4),
          const Text("Track your run in real-time", style: TextStyle(color: Colors.grey, fontSize: 12)),
          const SizedBox(height: 20),
          Container(
            height: 160,
            decoration: BoxDecoration(color: const Color(0xff1A1D29), borderRadius: BorderRadius.circular(14)),
            child: Center(
              child: _isRunning
                  ? Image.asset("assets/run.jpg", fit: BoxFit.cover, width: double.infinity, height: 160,
                      errorBuilder: (_, _, _) => const Icon(Icons.map, color: Color(0xffD7FF47), size: 36))
                  : const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [Icon(Icons.map, color: Color(0xffD7FF47), size: 36), SizedBox(height: 4),
                        Text("Map View", style: TextStyle(color: Colors.grey, fontSize: 11))],
                    ),
            ),
          ),
          const SizedBox(height: 24),
          Text(_time, style: const TextStyle(color: Colors.white, fontSize: 42, fontWeight: FontWeight.w300)),
          const SizedBox(height: 8),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            _statChip("0.0", "KM"), const SizedBox(width: 24), _statChip("0", "KCAL"), const SizedBox(width: 24), _statChip("--", "BPM"),
          ]),
          const SizedBox(height: 28),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            if (!_isRunning) _btn(Icons.play_arrow, "Start", const Color(0xffD7FF47), Colors.black, _toggleRun),
            if (_isRunning && !_isPaused) _btn(Icons.pause, "Pause", const Color(0xffD7FF47), Colors.black, _toggleRun),
            if (_isRunning && _isPaused) ...[
              _btn(Icons.play_arrow, "Resume", const Color(0xffD7FF47), Colors.black, _toggleRun),
              const SizedBox(width: 14),
              _btn(Icons.stop, "Stop", Colors.redAccent, Colors.white, _stopRun),
            ],
            if (_isRunning && !_isPaused) ...[
              const SizedBox(width: 14),
              _btn(Icons.stop, "Stop", Colors.redAccent, Colors.white, _stopRun),
            ],
          ]),
          const SizedBox(height: 28),
          const Align(alignment: Alignment.centerLeft, child:
            Text("Recent Runs", style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500))),
          const SizedBox(height: 12),
          _runHistory("Today", "3.2 km", "22 min", "220 kcal"),
          _runHistory("Yesterday", "2.8 km", "19 min", "195 kcal"),
          _runHistory("Mon", "5.1 km", "35 min", "340 kcal"),
          const SizedBox(height: 24),
        ]),
      ),
    );
  }

  static Widget _statChip(String value, String unit) {
    return Column(children: [
      Text(value, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300)),
      Text(unit, style: const TextStyle(color: Colors.grey, fontSize: 10)),
    ]);
  }

  static Widget _btn(IconData icon, String label, Color bg, Color fg, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 10),
        decoration: BoxDecoration(color: bg, borderRadius: BorderRadius.circular(22)),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, color: fg, size: 18),
          const SizedBox(width: 8),
          Text(label, style: TextStyle(color: fg, fontSize: 12, fontWeight: FontWeight.w500)),
        ]),
      ),
    );
  }

  static Widget _runHistory(String day, String dist, String duration, String kcal) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: const Color(0xff1A1D29), borderRadius: BorderRadius.circular(12)),
      child: Row(children: [
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(day, style: const TextStyle(color: Colors.white, fontSize: 12)),
            const SizedBox(height: 2),
            Text("$dist · $duration · $kcal", style: const TextStyle(color: Colors.grey, fontSize: 10)),
          ]),
        ),
        const Icon(Icons.chevron_right, color: Colors.grey, size: 16),
      ]),
    );
  }
}
