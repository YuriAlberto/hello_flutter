import 'package:flutter/material.dart';
import 'package:flutter_cardona/features/login/domain/entities/usuario.dart';
import 'package:flutter_cardona/features/login/presentation/widgets/item_usuario.dart';

class LoginBodyUsuarios extends StatelessWidget {
  List<Usuario> usuarios;
  LoginBodyUsuarios({this.usuarios});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top: 40, left: 25, right: 20),
          child: ListView.builder(
              itemCount: usuarios.length,
              itemBuilder: (BuildContext context, int index) {
                return ItemUsuario(usuario: usuarios[index]);
              })),
    );
  }
}
