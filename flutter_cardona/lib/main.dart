import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cardona/features/login/presentation/page/login_page.dart';

import 'features/login/presentation/bloc/bloc/login_bloc.dart';
import 'sl.dart' as di;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'i T i e n da',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            scaffoldBackgroundColor: Color.fromRGBO(242, 242, 242, 1),
            primaryColor: Color.fromRGBO(1, 230, 233, 1),
            accentColor: Colors.green.shade600),
        home: BlocProvider(
            create: (_) => di.sl<LoginBloc>(), child: LoginPage()));
  }
}
