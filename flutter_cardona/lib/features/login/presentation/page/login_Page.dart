import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cardona/features/login/presentation/bloc/bloc/login_bloc.dart';

class LoginPage extends StatefulWidget {
  LoginPage();

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      if (state is LoginInitial) {
        BlocProvider.of<LoginBloc>(context).add(GetPageLogin());
        return Text("Cargando");
      }
    });
  }
}
