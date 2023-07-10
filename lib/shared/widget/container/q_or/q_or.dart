// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../q_box_container/q_box_container.dart';

class Qor extends StatelessWidget {
  bool? sideContainer;

  Qor({
    Key? key,
    this.sideContainer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        (sideContainer != null)
            ? (sideContainer!)
                ? QBoxContainer(
                    height: 1,
                    color: Colors.grey[400],
                    width: MediaQuery.of(context).size.width / 2.5,
                  )
                : Container()
            : Container(),
        const SizedBox(
          width: 30.0,
        ),
        Text(
          "Or",
          style: TextStyle(
            fontSize: 15.0,
          ),
        ),
        const SizedBox(
          width: 30.0,
        ),
        (sideContainer != null)
            ? (sideContainer!)
                ? QBoxContainer(
                    height: 1,
                    color: Colors.grey[400],
                    width: MediaQuery.of(context).size.width / 2.5,
                  )
                : Container()
            : Container(),
      ],
    );
  }
}
