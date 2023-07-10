// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class QHeading extends StatelessWidget {
  String title;
  String? subtile;
  Function? ontap;
  double? fontSize;
  double? subTitlefontSize;
  QHeading({
    Key? key,
    required this.title,
    this.subtile,
    this.ontap,
    this.fontSize,
    this.subTitlefontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: fontSize ?? 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        (subtile != null)
            ? InkWell(
                onTap: () => ontap,
                child: Text(
                  subtile!,
                  style: TextStyle(
                    fontSize: subTitlefontSize ?? 15.0,
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
