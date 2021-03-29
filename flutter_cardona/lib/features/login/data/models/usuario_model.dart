import 'package:flutter_cardona/features/login/domain/entities/usuario.dart';

class UsuarioModel extends Usuario {
  UsuarioModel({String user_name, String password, String token, int id})
      : super(id: id, password: password, token: token, user_name: user_name);

  factory UsuarioModel.fromJson(Map<String, dynamic> json) {
    return UsuarioModel(
        id: json["id"],
        password: json["password"],
        token: json["token"],
        user_name: json["user_name"]);
  }

  Map<String, dynamic> toJson() {
    return {
      'user_name': this.user_name,
      'password': this.password,
      'token': this.token
    };
  }
}
