// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class QBoxContainer extends StatelessWidget {
  final double height;
  final double width;
  final Color? color;
  final BorderRadiusGeometry? borderRadius;

  const QBoxContainer({
    Key? key,
    required this.height,
    required this.width,
    this.color,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          color: color ?? Colors.black, borderRadius: borderRadius),
    );
  }
}
