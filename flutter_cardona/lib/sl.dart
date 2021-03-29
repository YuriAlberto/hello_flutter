import 'package:get_it/get_it.dart';

import 'features/login/presentation/bloc/bloc/login_bloc.dart';

final sl = GetIt.instance;

Future<void> init() {
  sl.registerFactory(() => LoginBloc());

  // Use Cases
}
