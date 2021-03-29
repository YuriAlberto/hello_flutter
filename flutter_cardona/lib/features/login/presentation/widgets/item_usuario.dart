import 'package:flutter/material.dart';
import 'package:flutter_cardona/features/login/domain/entities/usuario.dart';

class ItemUsuario extends StatelessWidget {
  final Usuario usuario;
  ItemUsuario({this.usuario});

  @override
  Widget build(BuildContext context) {
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
                      Text(
                          "Token :" +
                              ((usuario.token.toString() == "null")
                                  ? "Sin token"
                                  : usuario.token.toString()),
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
