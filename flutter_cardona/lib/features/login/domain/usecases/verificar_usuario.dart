import 'package:equatable/equatable.dart';
import 'package:flutter_cardona/core/feature/common/usecase.dart';
import 'package:flutter_cardona/features/login/domain/contracts/user_contracts.dart';
import 'package:flutter_cardona/features/login/domain/entities/usuario.dart';

class VerificarUsuario {
  final UserContracts repository;

  VerificarUsuario(this.repository);

  @override
  Future<bool> call(ParamsVerificarUsuario params) {
    return repository.verificarUsuario(params.usuario);
  }
}

class ParamsVerificarUsuario extends Equatable {
  Usuario usuario;
  ParamsVerificarUsuario(this.usuario);

  @override
  // TODO: implement props
  List<Object> get props => [];
}
