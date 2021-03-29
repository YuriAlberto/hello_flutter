import 'package:flutter/material.dart';

class EmailField extends StatelessWidget {
  final TextStyle style;
  final TextEditingController controller_username;

  EmailField({this.style, this.controller_username});

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: style,
      controller: controller_username,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
  }
}
