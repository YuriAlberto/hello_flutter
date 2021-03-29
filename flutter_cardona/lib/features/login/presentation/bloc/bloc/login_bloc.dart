import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_cardona/core/feature/common/usecase.dart';
import 'package:flutter_cardona/features/login/domain/entities/usuario.dart';
import 'package:flutter_cardona/features/login/domain/usecases/get_all_usuario.dart';
import 'package:flutter_cardona/features/login/domain/usecases/nuevo_usuario.dart';
import 'package:flutter_cardona/features/login/domain/usecases/verificar_usuario.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final GetAllUser getAllUser;
  final NuevoUsuario nuevoUsuario;
  final VerificarUsuario verificarUsuario;

  LoginBloc(
      {@required GetAllUser getAllUser,
      @required NuevoUsuario nuevoUsuario,
      @required VerificarUsuario verificarUsuario})
      : this.getAllUser = getAllUser,
        this.nuevoUsuario = nuevoUsuario,
        this.verificarUsuario = verificarUsuario,
        super(LoginInitial());

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is VerificarUsuarioEvent) {
      bool esta_registrado = await verificarUsuario(ParamsVerificarUsuario(
          Usuario(password: "3434343", user_name: "lina@gmail.com")));
      List<Usuario> usuarios = await getAllUser(NoParams());

      yield ListaUsuarioShowState(usuarios: usuarios);
    }
  }
}
