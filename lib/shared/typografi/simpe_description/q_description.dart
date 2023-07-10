import 'package:flutter/material.dart';

class QDescription extends StatelessWidget {
  final String description;
  const QDescription({
    Key? key,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        description,
        textAlign: TextAlign.justify,
        style: const TextStyle(
          fontSize: 18.0,
        ),
      ),
    );
  }
}
