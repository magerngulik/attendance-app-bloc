import 'package:flutter/material.dart';

class QPointText extends StatelessWidget {
  final String title;
  const QPointText({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Icon(
          Icons.circle,
          size: 5,
          color: Colors.grey,
        ),
        const SizedBox(
          width: 10.0,
        ),
        Text(
          title,
          style: const TextStyle(
            fontSize: 13.0,
          ),
        ),
      ],
    );
  }
}
