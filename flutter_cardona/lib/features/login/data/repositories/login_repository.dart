import 'package:flutter_cardona/features/login/data/models/usuario_model.dart';
import 'package:flutter_cardona/features/login/data/sourcedata/login_remote_data_source.dart';
import 'package:flutter_cardona/features/login/domain/contracts/user_contracts.dart';
import 'package:flutter_cardona/features/login/domain/entities/usuario.dart';

class LoginRepository implements UserContracts {
  final LoginRemoteDataSourceContract loginRemoteDataSourceContract;

  LoginRepository({this.loginRemoteDataSourceContract});

  @override
  Future<List<Usuario>> getAllUsuarios() {
    return loginRemoteDataSourceContract.getAllUsuarios();
  }

  @override
  Future<Usuario> nuevoUsuario(Usuario usuario) {
    return loginRemoteDataSourceContract.nuevoUsuario(UsuarioModel(
        password: usuario.password,
        id: usuario.id,
        token: usuario.token,
        user_name: usuario.user_name));
  }

  @override
  Future<bool> verificarUsuario(Usuario usuario) {
    return loginRemoteDataSourceContract.verificarUsuario(UsuarioModel(
        password: usuario.password,
        id: usuario.id,
        token: usuario.token,
        user_name: usuario.user_name));
  }
}
