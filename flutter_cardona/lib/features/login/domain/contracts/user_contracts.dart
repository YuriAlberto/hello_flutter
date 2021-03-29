import 'package:flutter_cardona/features/login/domain/entities/usuario.dart';

abstract class UserContracts {
  Future<Usuario> nuevoUsuario(Usuario usuario);

  Future<bool> verificarUsuario(Usuario usuario);

  Future<List<Usuario>> getAllUsuarios();
}
