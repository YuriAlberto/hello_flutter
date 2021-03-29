import 'package:flutter_cardona/core/feature/common/usecase.dart';
import 'package:flutter_cardona/features/login/domain/contracts/user_contracts.dart';
import 'package:flutter_cardona/features/login/domain/entities/usuario.dart';

class GetAllUser {
  final UserContracts repository;

  GetAllUser(this.repository);

  @override
  Future<List<Usuario>> call(NoParams noParams) {
    return repository.getAllUsuarios();
  }
}
