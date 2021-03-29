import 'package:equatable/equatable.dart';

class Usuario extends Equatable {
  final int id;
  final String user_name;
  final String password;
  final String token;

  Usuario({this.user_name, this.password, this.token, this.id});

  List<Object> get props => [];
}
