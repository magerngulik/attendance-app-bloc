import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/material.dart';

Future showInfoDialog(
    {required BuildContext buildContext,
    required String message,
    required String title}) async {
  await showDialog<void>(
    context: buildContext,
    builder: (context) {
      return Container(
        color: Colors.black.withOpacity(0.4),
        child: Center(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Wrap(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20.0),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        Text(
                          message,
                          style: const TextStyle(
                            fontSize: 14.0,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(),
                          onPressed: () => Navigator.pop(context),
                          child: const Text("Ok"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ).animate().fade().shake(),
        ),
      );
    },
  );
}
