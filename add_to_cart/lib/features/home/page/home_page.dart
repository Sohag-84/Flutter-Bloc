import 'package:add_to_cart/features/cart/page/cart_page.dart';
import 'package:add_to_cart/features/home/bloc/home_bloc.dart';
import 'package:add_to_cart/features/wishlist/page/wishlist_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        if (state is NavigateToWishlistPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const WishlistPage(),
            ),
          );
        }
        if (state is NavigateToCartPageActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const CartPage(),
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Grocery App"),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  context
                      .read<HomeBloc>()
                      .add(HomeWishlistButtonNavigateEvent());
                },
                icon: const Icon(Icons.favorite),
              ),
              IconButton(
                onPressed: () {
                  context.read<HomeBloc>().add(HomeCartButtonNavigateEvent());
                },
                icon: const Icon(Icons.shopping_bag_outlined),
              ),
            ],
          ),
        );
      },
    );
  }
}
