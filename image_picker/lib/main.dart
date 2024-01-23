import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker_using_bloc/bloc/image_picker_bloc.dart';
import 'package:image_picker_using_bloc/ui/home_screen.dart';
import 'package:image_picker_using_bloc/utils/image_picker_utils.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ImagePickerBloc(
            imagePickerUtitls: ImagePickerUtitls(),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Image Picker',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
