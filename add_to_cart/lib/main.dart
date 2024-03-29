import 'package:add_to_cart/features/cart/bloc/cart_bloc.dart';
import 'package:add_to_cart/features/home/bloc/home_bloc.dart';
import 'package:add_to_cart/features/home/page/home_page.dart';
import 'package:add_to_cart/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomeBloc()),
        BlocProvider(create: (context) => CartBloc()),
        BlocProvider(create: (context) => WishlistBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: false,
        ),
        home: const HomePage(),
      ),
    );
  }
}
