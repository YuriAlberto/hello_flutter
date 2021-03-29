import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cardona/features/login/domain/entities/usuario.dart';
import 'package:flutter_cardona/features/login/presentation/bloc/bloc/login_bloc.dart';
import 'package:flutter_cardona/features/login/presentation/widgets/bodies/login_body_inicio.dart';
import 'package:flutter_cardona/features/login/presentation/widgets/bodies/login_body_inicio_error.dart';
import 'package:flutter_cardona/features/login/presentation/widgets/dialogs/nuevo_usuario_dialog.dart';

class LoginPage extends StatefulWidget {
  LoginPage();

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final controller_username = TextEditingController();
  final controller_password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      if (state is LoginInitial) {
        BlocProvider.of<LoginBloc>(context).add(GetPageInicioLoginEvent());
        return Scaffold(
            body: LoginBodyInicio(
          controller_password: controller_password,
          controller_username: controller_username,
          style: style,
        ));
      }
      if (state is LoginInicioErrorState) {
        BlocProvider.of<LoginBloc>(context).add(GetPageInicioLoginEvent());
        return Scaffold(
            body: LoginBodyInicioError(
          controller_password: controller_password,
          controller_username: controller_username,
          style: style,
          mensaje: state.mensaje,
        ));
      }
      if (state is ListaUsuarioShowState) {
        return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.only(top: 40, left: 25, right: 20),
                  child: ListView.builder(
                      itemCount: state.usuarios.length,
                      itemBuilder: (BuildContext context, int index) {
                        return item(context, state.usuarios[index]);
                      })),
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () async {
                  Usuario usuario_r = await showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return NuevoUsuarioDialog();
                      });
                  BlocProvider.of<LoginBloc>(context)
                      .add(AddUsuarioEvent(usuario: usuario_r));
                },
                child: Icon(Icons.add)));
      }
    });
  }

  Widget item(BuildContext context, Usuario usuario) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pop(usuario),
      child: Column(
        children: [
          SizedBox(height: 10),
          Row(
            children: [
              CircleAvatar(
                child: Text(usuario.user_name.toString().substring(0, 1)),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(usuario.user_name,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 10),
                      Text("Valor :" + usuario.token.toString() + "%",
                          style:
                              TextStyle(fontSize: 12, color: Colors.black54)),
                    ])),
              ),
            ],
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
