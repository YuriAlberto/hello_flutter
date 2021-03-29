part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class GetPageInicioLoginEvent extends LoginEvent {}

class VerificarUsuarioEvent extends LoginEvent {
  final String username;
  final String password;
  VerificarUsuarioEvent({this.password, this.username});
}

class AddUsuarioEvent extends LoginEvent {
  final Usuario usuario;
  AddUsuarioEvent({this.usuario});
}
