import 'package:flutter/material.dart';

class QClockHomePage extends StatelessWidget {
  final String time;
  final String status;
  final IconData icon;
  const QClockHomePage({
    Key? key,
    required this.time,
    required this.status,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 30.0,
          color: Colors.purple,
        ),
        Text(
          time,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          status,
          style: const TextStyle(
            fontSize: 13.0,
          ),
        ),
      ],
    );
  }
}
