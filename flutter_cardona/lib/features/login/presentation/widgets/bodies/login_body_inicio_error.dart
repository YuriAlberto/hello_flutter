import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cardona/features/login/presentation/bloc/bloc/login_bloc.dart';
import 'package:flutter_cardona/features/login/presentation/widgets/emailfield.dart';
import 'package:flutter_cardona/features/login/presentation/widgets/passwordfield.dart';

class LoginBodyInicioError extends StatelessWidget {
  final TextStyle style;
  final TextEditingController controller_password;
  final TextEditingController controller_username;
  final String mensaje;

  LoginBodyInicioError(
      {this.style,
      this.controller_password,
      this.controller_username,
      this.mensaje});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 155.0,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 45.0),
                EmailField(
                    controller_username: controller_username, style: style),
                SizedBox(height: 25.0),
                PasswordField(
                  controller_password: controller_password,
                  style: style,
                ),
                SizedBox(
                  height: 35.0,
                ),
                loginButon(context),
                SizedBox(
                  height: 15.0,
                ),
                Text(
                  mensaje,
                  style: TextStyle(color: Colors.red),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget loginButon(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _verificarUsario(
              context: context,
              password: controller_password.text.toString(),
              user_name: controller_username.text.toString());
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }

  void _verificarUsario(
      {BuildContext context, String user_name, String password}) {
    BlocProvider.of<LoginBloc>(context)
        .add(VerificarUsuarioEvent(username: user_name, password: password));
  }
}
