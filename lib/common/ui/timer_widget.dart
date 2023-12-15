import 'dart:async';

import 'package:flutter/material.dart';

class TimerWidget extends StatefulWidget {
  final int initialSeconds;
  final IconData icon;
  final String text;
  final Function? onFinished;

  const TimerWidget({
    super.key,
    required this.initialSeconds,
    required this.icon,
    required this.text,
    this.onFinished,
  });

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  int remainingSeconds = 0;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    remainingSeconds = widget.initialSeconds;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingSeconds > 0) {
        setState(() {
          remainingSeconds--;
        });
      } else {
        timer.cancel();
        if (widget.onFinished != null) {
          widget.onFinished!();
        }
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(widget.icon, color: Colors.white),
        const SizedBox(width: 10),
        Text(
          '${remainingSeconds}s',
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      ],
    );
  }
}
