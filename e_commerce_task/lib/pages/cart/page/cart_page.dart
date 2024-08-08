import 'package:e_commerce_task/pages/cart/bloc/cart_bloc.dart';
import 'package:e_commerce_task/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cart"),
        centerTitle: true,
      ),
      body: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartUpdated) {
            final cartItems = state.cartList;
            final totalPrice = state.totalPrice;
            if (cartItems.isEmpty) {
              return const Center(child: Text("Your cart is empty."));
            } else {
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartItems.length,
                      itemBuilder: (context, index) {
                        final product = cartItems[index];
                        return Card(
                          child: Container(
                            padding: EdgeInsets.all(5.w),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.r),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Row(
                              children: [
                                Image.network(
                                  "https://cdn.pixabay.com/photo/2016/12/27/13/10/logo-1933884_640.png",
                                  width: 80,
                                  height: 80,
                                ),
                                Gap(8.w),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      //product name
                                      Text(
                                        product.name ?? "",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      //product price
                                      Text("Price: \$${product.price}"),

                                      ///update quantity
                                      SizedBox(
                                        width: 150,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            ///decrease
                                            Container(
                                              height: 40.h,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: AppColors
                                                          .primaryColor),
                                                  shape: BoxShape.circle),
                                              child: IconButton(
                                                icon: const Icon(Icons.remove,
                                                    size: 20),
                                                onPressed: () {
                                                  context.read<CartBloc>().add(
                                                      DecreaseCartItemQuantity(
                                                          product: product));
                                                },
                                              ),
                                            ),
                                            //quantity
                                            Text(
                                              "${product.quantity}",
                                              style: TextStyle(
                                                  fontSize: 17.sp,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            //increase
                                            Container(
                                              height: 40.h,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: AppColors
                                                          .primaryColor),
                                                  shape: BoxShape.circle),
                                              child: IconButton(
                                                icon: const Icon(Icons.add,
                                                    size: 20),
                                                onPressed: () {
                                                  context.read<CartBloc>().add(
                                                        IncreaseCartItemQuantity(
                                                            product: product),
                                                      );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: const Icon(
                                    Icons.delete_forever_outlined,
                                    color: Colors.red,
                                    size: 35,
                                  ),
                                  onPressed: () {
                                    context
                                        .read<CartBloc>()
                                        .add(RemoveFromCart(product: product));
                                  },
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Total: \$${totalPrice.toStringAsFixed(2)}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {},
                      child: const Text("Order Now"),
                    ),
                  ),
                ],
              );
            }
          }
          return const Center(child: Text("Your cart is empty."));
        },
      ),
    );
  }
}
