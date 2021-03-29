import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_cardona/core/feature/common/usecase.dart';
import 'package:flutter_cardona/core/util/validador_field.dart';
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
  final ValidadorCampo validadorCampo;

  bool _refrescar = false;
  List<Usuario> _usuarios;

  LoginBloc(
      {this.validadorCampo,
      @required GetAllUser getAllUser,
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
      if (validadorCampo.isEmailvalido(event.username) &&
          validadorCampo.isCampoSinNul(event.password)) {
        bool esta_registrado = await verificarUsuario(ParamsVerificarUsuario(
            Usuario(password: event.password, user_name: event.username)));
        if (esta_registrado) {
          _usuarios = await getAllUser(NoParams());
          _refrescar = _refrescar ? false : true;
          yield ListaUsuarioShowState(
              usuarios: _usuarios, refrescar: _refrescar);
        } else {
          yield LoginInicioErrorState(
              mensaje: "Por favor verifica email o contraseña");
        }
      } else {
        yield LoginInicioErrorState(mensaje: "Por favor verifica emails");
      }
    }

    if (event is AddUsuarioEvent) {
      _refrescar = _refrescar ? false : true;

      if (validadorCampo.isEmailvalido(event.usuario.user_name) &&
          validadorCampo.isCampoSinNul(event.usuario.password)) {
        List<Usuario> usuarios = [];

        usuarios.addAll(_usuarios);
        usuarios.add(event.usuario);
        _usuarios = [];
        _usuarios.addAll(usuarios);
        nuevoUsuario(ParamsNuevoUsuario(event.usuario));
        yield ListaUsuarioShowState(usuarios: usuarios, refrescar: _refrescar);
      } else {
        yield LoginListaUsuarioErrorState(
            mensaje: "por favor verificar email o ingrese una contraseña",
            usuarios: _usuarios,
            refrescar: _refrescar);
      }
    }
  }
}
