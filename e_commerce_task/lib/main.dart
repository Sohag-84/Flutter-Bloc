import 'package:e_commerce_task/app_bloc_ovserver.dart';
import 'package:e_commerce_task/pages/home/bloc/home_bloc.dart';
import 'package:e_commerce_task/pages/home/pages/home_page.dart';
import 'package:e_commerce_task/pages/login/bloc/login_bloc.dart';
import 'package:e_commerce_task/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'data/local_preference.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  LocalPreferenceService.instance.init();
  Bloc.observer = AppBlocOvserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    String token = LocalPreferenceService.instance.getToken();
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginBloc()),
        BlocProvider(create: (context) => HomeBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: token.isEmpty ? LoginPage() : HomePage(),
      ),
    );
  }
}
