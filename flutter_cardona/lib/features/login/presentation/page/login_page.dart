import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cardona/features/login/domain/entities/usuario.dart';
import 'package:flutter_cardona/features/login/presentation/bloc/bloc/login_bloc.dart';
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
    final emailField = TextField(
      obscureText: true,
      style: style,
      controller: controller_username,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final passwordField = TextField(
      obscureText: true,
      controller: controller_password,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          _verificarUsario(
              password: controller_password.text.toString(),
              user_name: controller_username.text.toString());
        },
        child: Text("Login",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
    return BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
      if (state is LoginInitial) {
        BlocProvider.of<LoginBloc>(context).add(GetPageInicioLoginEvent());
        return Scaffold(
            body: SingleChildScrollView(
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
                    emailField,
                    SizedBox(height: 25.0),
                    passwordField,
                    SizedBox(
                      height: 35.0,
                    ),
                    loginButon,
                    SizedBox(
                      height: 15.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
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

  void _verificarUsario({String user_name, String password}) {
    BlocProvider.of<LoginBloc>(context)
        .add(VerificarUsuarioEvent(username: user_name, password: password));
  }
}
