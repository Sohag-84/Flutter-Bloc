import 'package:add_to_cart/features/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WishlistPage extends StatefulWidget {
  const WishlistPage({super.key});

  @override
  State<WishlistPage> createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  @override
  void initState() {
    super.initState();
    context.read<WishlistBloc>().add(WishlistInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WishlistBloc, WishlistState>(
      listener: (context, state) {},
      builder: (context, state) {
        switch (state.runtimeType) {
          case WishlistLoadingState:
            return const Center(
              child: CircularProgressIndicator(),
            );

          case WishlistSuccessState:
            final wishlistItem = state as WishlistSuccessState;
            return Scaffold(
              appBar: AppBar(
                title: const Text("Wishlist Product"),
                centerTitle: true,
              ),
              body: wishlistItem.favProductList.isEmpty
                  ? const Center(
                      child: Text(
                        "No item found!",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: wishlistItem.favProductList.length,
                      itemBuilder: (context, index) {
                        final item = wishlistItem.favProductList[index];
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: ListTile(
                              leading: ClipRRect(
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                    item.imageUrl,
                                  ),
                                ),
                              ),
                              title: Text(
                                item.name,
                                style: const TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text("\$${item.price}"),
                              trailing: IconButton(
                                onPressed: () {
                                  context.read<WishlistBloc>().add(
                                        WishlistItemRemovedFromWishlist(
                                          productDataModel: item,
                                        ),
                                      );
                                },
                                icon: const Icon(
                                  Icons.delete_forever,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ),
                        );
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
