import 'package:add_to_cart/features/cart/page/cart_page.dart';
import 'package:add_to_cart/features/home/bloc/home_bloc.dart';
import 'package:add_to_cart/features/home/page/product_tile_widget.dart';
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
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(HomeInitialEvent());
  }

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

        if (state is HomeProductWishlistedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Added to wishlist"),
            ),
          );
        }
        if (state is HomeProductCartlistedActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Added to Cart"),
            ),
          );
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case HomeErrorState:
            return Scaffold(
              body: Text((state as HomeErrorState).errorMsg.toString()),
            );

          case HomeLoadedSuccessState:
            final productModel = state as HomeLoadedSuccessState;
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
                      context
                          .read<HomeBloc>()
                          .add(HomeCartButtonNavigateEvent());
                    },
                    icon: const Icon(Icons.shopping_bag_outlined),
                  ),
                ],
              ),
              body: ListView.builder(
                itemCount: productModel.productList.length,
                itemBuilder: (context, index) {
                  final item = productModel.productList[index];
                  return ProductTileWidget(productDataModel: item);
                },
              ),
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}
