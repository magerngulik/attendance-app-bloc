import 'package:attendance_app/shared/widget/container/q_box_container/q_box_container.dart';
import 'package:flutter/material.dart';

class QShimmerText extends StatelessWidget {
  const QShimmerText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QBoxContainer(
          height: MediaQuery.of(context).size.height / 6,
          width: MediaQuery.of(context).size.width,
          color: Colors.grey,
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            QBoxContainer(
              height: MediaQuery.of(context).size.height / 50,
              width: MediaQuery.of(context).size.width / 4,
              color: Colors.grey,
              borderRadius: const BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
            const Spacer(),
            QBoxContainer(
              height: MediaQuery.of(context).size.height / 80,
              width: MediaQuery.of(context).size.width / 10,
              color: Colors.grey,
              borderRadius: const BorderRadius.all(
                Radius.circular(12.0),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 5.0,
        ),
        QBoxContainer(
          height: MediaQuery.of(context).size.height / 80,
          width: MediaQuery.of(context).size.width / 6,
          color: Colors.grey,
          borderRadius: const BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
      ],
    );
  }
}
