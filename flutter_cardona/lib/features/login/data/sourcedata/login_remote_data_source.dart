import 'package:flutter_cardona/features/login/data/models/usuario_model.dart';
import 'package:flutter_cardona/features/login/domain/entities/usuario.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

abstract class LoginRemoteDataSourceContract {
  Future<Usuario> nuevoUsuario(UsuarioModel usuario);

  Future<bool> verificarUsuario(UsuarioModel usuario);

  Future<List<Usuario>> getAllUsuarios();
}

class LoginRemoteDataSource implements LoginRemoteDataSourceContract {
  final http.Client client;

  LoginRemoteDataSource({this.client});

  @override
  Future<List<Usuario>> getAllUsuarios() async {
    List<UsuarioModel> usuarios =
        await _getUsuariosFromUrl("http://www.ietarido.edu.co/usuarios.php");
    return usuarios;
  }

  @override
  Future<Usuario> nuevoUsuario(Usuario usuario) {
    // TODO: implement nuevoUsuario
    throw UnimplementedError();
  }

  @override
  Future<bool> verificarUsuario(UsuarioModel usuario) async {
    List<UsuarioModel> usuarios =
        await _getUsuariosFromUrl("http://www.ietarido.edu.co/usuarios.php");

    return _estaRegistradoUsuario(usuarios, usuario);
  }

  Future<List<UsuarioModel>> _getUsuariosFromUrl(String url) async {
    final response = await client.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      print("hola mama");
      Iterable list = json.decode(response.body);
      List<UsuarioModel> usuarios =
          list.map((model) => UsuarioModel.fromJson(model)).toList();
      return usuarios;
    } else {
      return [];
    }
  }

  Future<bool> _estaRegistradoUsuario(
      List<UsuarioModel> usuariosModes, UsuarioModel usuario) {
    bool estado = false;
    for (var u in usuariosModes) {
      if (u.password == usuario.password && u.user_name == usuario.user_name) {
        estado = true;
        break;
      }
    }
    return Future<bool>.value(estado);
  }
}
