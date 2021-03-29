import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cardona/features/login/domain/entities/usuario.dart';

class NuevoUsuarioDialog extends StatefulWidget {
  @override
  _NuevoUsuarioDialogState createState() => _NuevoUsuarioDialogState();
}

class _NuevoUsuarioDialogState extends State<NuevoUsuarioDialog> {
  final controller_username = TextEditingController();
  final controller_password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 20, left: 20, right: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                "Crear nuevo Usuarios",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 15,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: controller_username,
                      cursorColor: Colors.red,
                      decoration: InputDecoration(
                          hintText: "Username. Ej: yuri@gmail.com",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.black45)),
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w300),
                      keyboardType: TextInputType.emailAddress,
                      autofocus: true,
                    )),
                Container(
                    padding: EdgeInsets.all(10),
                    child: TextField(
                      controller: controller_password,
                      cursorColor: Colors.red,
                      decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.black45)),
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w300),
                      keyboardType: TextInputType.visiblePassword,
                      autofocus: true,
                    )),
              ]),
              Align(
                alignment: Alignment.bottomRight,
                child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text(
                              "Cancelar",
                              style: TextStyle(fontSize: 18),
                            )),
                        FlatButton(
                            onPressed: () {
                              Navigator.of(context).pop(Usuario(
                                  password: controller_password.text.toString(),
                                  user_name:
                                      controller_username.text.toString()));
                            },
                            child: Text(
                              "Aceptar",
                              style: TextStyle(fontSize: 18),
                            )),
                      ],
                    )),
              ),
            ],
          ),
        )
      ],
    );
  }
}
