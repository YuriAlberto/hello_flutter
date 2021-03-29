import 'package:equatable/equatable.dart';
import 'package:flutter_cardona/features/login/domain/contracts/user_contracts.dart';
import 'package:flutter_cardona/features/login/domain/entities/usuario.dart';

class NuevoUsuario {
  final UserContracts repository;

  NuevoUsuario(this.repository);

  @override
  Future<Usuario> call(ParamsNuevoUsuario paramsNuevoUsuario) {
    return repository.nuevoUsuario(paramsNuevoUsuario.usuario);
  }
}

class ParamsNuevoUsuario extends Equatable {
  Usuario usuario;
  ParamsNuevoUsuario(this.usuario);

  @override
  // TODO: implement props
  List<Object> get props => [];
}
