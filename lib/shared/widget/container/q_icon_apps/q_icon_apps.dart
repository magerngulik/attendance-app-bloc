import 'package:flutter/material.dart';

class QIconApps extends StatelessWidget {
  double? height;
  double? width;
  QIconApps({
    Key? key,
    this.height,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 150.0,
      width: width ?? 150.0,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            "assets/icon/travel-and-tourism.png",
          ),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            16.0,
          ),
        ),
      ),
    );
  }
}
