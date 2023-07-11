import 'package:flutter/material.dart';

class Qloading extends StatelessWidget {
  const Qloading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Loading",
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
