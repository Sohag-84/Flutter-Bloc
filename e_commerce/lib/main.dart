import 'package:e_commerce/presentation/bottom_navbar/bloc/bottom_nav_bloc.dart';
import 'package:e_commerce/presentation/bottom_navbar/views/bottom_navbar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(398, 720),
      builder: (context, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context) => BottomNavBloc(),
            ),
          ],
          child: MaterialApp(
            title: 'Flutter E-commerce',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const BottomNavbarView(),
          ),
        );
      },
    );
  }
}
