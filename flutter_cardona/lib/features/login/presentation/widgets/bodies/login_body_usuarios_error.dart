import 'package:flutter/material.dart';
import 'package:flutter_cardona/features/login/domain/entities/usuario.dart';
import 'package:flutter_cardona/features/login/presentation/widgets/item_usuario.dart';

class LoginBodyUsuariosError extends StatelessWidget {
  final List<Usuario> usuarios;
  final String mensaje;
  LoginBodyUsuariosError({this.usuarios, this.mensaje});

  @override
  Widget build(BuildContext context) {
    print("##########mimam677777a");
    showNotificacion(mensaje, context);
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
              height: MediaQuery.of(context).size.height,
              padding: EdgeInsets.only(top: 40, left: 25, right: 20),
              child: ListView.builder(
                  itemCount: usuarios.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemUsuario(usuario: usuarios[index]);
                  })),
        ],
      ),
    );
  }

  void showNotificacion(String notificacion, BuildContext me) {
    WidgetsBinding.instance
        .addPostFrameCallback((_) => Scaffold.of(me).showSnackBar(SnackBar(
              content: Text(notificacion),
              duration: Duration(seconds: 2),
            )));
  }
}
