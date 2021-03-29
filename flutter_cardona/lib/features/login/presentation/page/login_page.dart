import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cardona/features/login/domain/entities/usuario.dart';
import 'package:flutter_cardona/features/login/presentation/bloc/bloc/login_bloc.dart';
import 'package:flutter_cardona/features/login/presentation/widgets/bodies/login_body_inicio.dart';
import 'package:flutter_cardona/features/login/presentation/widgets/bodies/login_body_inicio_error.dart';
import 'package:flutter_cardona/features/login/presentation/widgets/bodies/login_body_usuarios.dart';
import 'package:flutter_cardona/features/login/presentation/widgets/bodies/login_body_usuarios_error.dart';
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
            body: LoginBodyUsuarios(usuarios: state.usuarios),
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
      if (state is LoginListaUsuarioErrorState) {
        return Scaffold(
            body: LoginBodyUsuariosError(
              usuarios: state.usuarios,
              mensaje: state.mensaje,
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
}
