import 'package:flutter/material.dart';

class QDontHaveAccont extends StatelessWidget {
  final Function ontap;
  final String? title;
  final String? subtitile;
  const QDontHaveAccont({
    Key? key,
    required this.ontap,
    this.title,
    this.subtitile,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title ?? "Don't have an account?",
          style: const TextStyle(
            fontSize: 15.0,
          ),
        ),
        const SizedBox(
          width: 4.0,
        ),
        InkWell(
          onTap: () => ontap(),
          child: Text(
            subtitile ?? "Sign Up",
            style: TextStyle(
              fontSize: 15.0,
              fontWeight: FontWeight.bold,
              color: Colors.red[200],
            ),
          ),
        ),
      ],
    );
  }
}
