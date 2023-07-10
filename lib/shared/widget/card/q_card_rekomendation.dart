import 'package:flutter/material.dart';

// ignore: must_be_immutable
class QCardListRecomendation extends StatelessWidget {
  String image, title;
  double? fontSize;
  EdgeInsetsGeometry? margin;
  QCardListRecomendation(
      {Key? key,
      required this.title,
      required this.image,
      required this.fontSize,
      this.margin})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.0,
      width: 150.0,
      margin: margin,
      decoration: const BoxDecoration(),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  image,
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(
                  16.0,
                ),
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              borderRadius: const BorderRadius.all(
                Radius.circular(16.0),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: fontSize ?? 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
