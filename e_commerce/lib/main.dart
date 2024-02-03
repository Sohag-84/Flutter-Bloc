import 'package:e_commerce/data/repository/category_repository.dart';
import 'package:e_commerce/presentation/bottom_navbar/bloc/bottom_nav_bloc.dart';
import 'package:e_commerce/presentation/bottom_navbar/views/bottom_navbar_view.dart';
import 'package:e_commerce/presentation/category/bloc/category_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'data/database/hive_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitUp]);

  var directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(HiveProductAdapter());
  await Hive.openBox<HiveProduct>("cart");
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
            BlocProvider(
              create: (context) => CategoryBloc(
                categoryRepository: CategoryRepository(),
              ),
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
