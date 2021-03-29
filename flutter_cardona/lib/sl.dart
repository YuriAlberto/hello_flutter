import 'package:flutter_cardona/features/login/data/sourcedata/login_remote_data_source.dart';
import 'package:flutter_cardona/features/login/domain/usecases/get_all_usuario.dart';
import 'package:flutter_cardona/features/login/domain/usecases/nuevo_usuario.dart';
import 'package:flutter_cardona/features/login/domain/usecases/verificar_usuario.dart';
import 'package:get_it/get_it.dart';

import 'features/login/data/repositories/login_repository.dart';
import 'features/login/domain/contracts/user_contracts.dart';
import 'features/login/presentation/bloc/bloc/login_bloc.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() {
  // blocs
  sl.registerFactory(() =>
      LoginBloc(getAllUser: sl(), nuevoUsuario: sl(), verificarUsuario: sl()));

  // Use Cases

  sl.registerLazySingleton(() => GetAllUser(sl()));
  sl.registerLazySingleton(() => NuevoUsuario(sl()));
  sl.registerLazySingleton(() => VerificarUsuario(sl()));

  // Contracts
  sl.registerLazySingleton<UserContracts>(
      () => LoginRepository(loginRemoteDataSourceContract: sl()));

  // Data sources

  sl.registerLazySingleton<LoginRemoteDataSourceContract>(
      () => LoginRemoteDataSource(client: sl()));

  //! External
  sl.registerLazySingleton(() => http.Client());
}
