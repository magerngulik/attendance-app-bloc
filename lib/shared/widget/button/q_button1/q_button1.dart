// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class QButton extends StatelessWidget {
  String title;
  Function ontap;
  Color? color;
  Color? backgroundColor;
  double? fontSize;

  QButton({
    Key? key,
    required this.title,
    required this.ontap,
    this.color,
    this.backgroundColor,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: 300,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        onPressed: () => ontap(),
        child: Text(
          title,
          style: TextStyle(
            color: color,
            fontSize: fontSize ?? 14,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
