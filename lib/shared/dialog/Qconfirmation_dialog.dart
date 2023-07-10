import 'package:flutter/material.dart';

Future<bool> qshowConfirmationDialog(
    {required BuildContext context,
    required Function ontap,
    required String title,
    required String message}) async {
  bool confirm = false;
  await showDialog<void>(
    context: context,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message),
            ],
          ),
        ),
        actions: <Widget>[
          Theme(
            data: ThemeData.dark(),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey[600],
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text(
                  "No",
                )),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(),
            onPressed: () => ontap(),
            child: const Text("Yes"),
          ),
        ],
      );
    },
  );

  return Future.value(confirm);
}
