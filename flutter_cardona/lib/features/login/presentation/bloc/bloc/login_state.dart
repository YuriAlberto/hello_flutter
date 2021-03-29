part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class ListaUsuarioShowState extends LoginState {
  final List<Usuario> usuarios;

  ListaUsuarioShowState({this.usuarios});

  @override
  List<Object> get props => [usuarios];
}
