import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final TextStyle style;
  final TextEditingController controller_password;

  PasswordField({this.style, this.controller_password});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: true,
      controller: controller_password,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
  }
}
