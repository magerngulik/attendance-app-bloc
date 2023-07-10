// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class QTextfieldLogin extends StatefulWidget {
  String title;
  String hintText;
  Icon? icon;
  bool? obscureText;
  final String? Function(String?)? validator;
  TextEditingController controller;

  QTextfieldLogin({
    Key? key,
    required this.title,
    required this.hintText,
    this.icon,
    this.obscureText,
    this.validator,
    required this.controller,
  }) : super(key: key);

  @override
  State<QTextfieldLogin> createState() => _QTextfieldLoginState();
}

class _QTextfieldLoginState extends State<QTextfieldLogin> {
  bool? visibility;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.obscureText != null) {
      visibility = widget.obscureText;
    }
  }

  changeVisibility() {
    visibility = !visibility!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: const TextStyle(
              fontSize: 18.0,
            ),
          ),
          TextFormField(
            controller: widget.controller,
            validator: widget.validator,
            obscureText: visibility ?? false,
            decoration: InputDecoration(
              hintText: widget.hintText,
              labelStyle: TextStyle(
                color: Colors.blueGrey,
              ),
              suffixIcon: (widget.obscureText != null)
                  ? (visibility == true)
                      ? InkWell(
                          onTap: changeVisibility,
                          child: const Icon(
                            Icons.visibility,
                            size: 24.0,
                          ),
                        )
                      : InkWell(
                          onTap: changeVisibility,
                          child: const Icon(
                            Icons.visibility_off,
                            size: 24.0,
                          ),
                        )
                  : widget.icon ??
                      const Icon(
                        Icons.check,
                        color: Colors.green,
                        size: 24.0,
                      ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blueGrey,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
