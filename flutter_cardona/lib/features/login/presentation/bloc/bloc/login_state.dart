part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class ListaUsuarioShowState extends LoginState {
  final List<Usuario> usuarios;
  final bool refrescar;

  ListaUsuarioShowState({this.usuarios, this.refrescar});

  @override
  List<Object> get props => [usuarios, refrescar];
}

class LoginInicioErrorState extends LoginState {
  String mensaje;

  LoginInicioErrorState({this.mensaje});
}

class LoginListaUsuarioErrorState extends LoginState {
  final String mensaje;
  final List<Usuario> usuarios;
  final bool refrescar;

  LoginListaUsuarioErrorState({this.mensaje, this.refrescar, this.usuarios});

  @override
  List<Object> get props => [usuarios, refrescar, mensaje];
}
