import 'package:e_commerce_task/common%20widgets/custom_button.dart';
import 'package:e_commerce_task/data/local_preference.dart';
import 'package:e_commerce_task/pages/cart/bloc/cart_bloc.dart';
import 'package:e_commerce_task/pages/cart/page/cart_page.dart';
import 'package:e_commerce_task/pages/home/bloc/home_bloc.dart';
import 'package:e_commerce_task/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';

import '../widgets/product_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().add(ProductFetched());
    _searchController.addListener(_onSearchChanged);
  }

  void _onSearchChanged() {
    context.read<HomeBloc>().add(SearchProduct(query: _searchController.text));
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
        actions: [
          BlocListener<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is LogoutSuccess) {
                Fluttertoast.showToast(msg: state.message);
              }
              if (state is LogoutFailure) {
                Fluttertoast.showToast(msg: state.error);
              }
            },
            child: IconButton(
              onPressed: () {
                LocalPreferenceService.instance.removeToken();
                context.read<HomeBloc>().add(LogoutButtonPressed());
              },
              icon: const Icon(Icons.logout),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          double totalPrice = 0;
          if (state is CartUpdated) {
            totalPrice = state.totalPrice;
          }
          return Container(
            height: 85.h,
            padding: EdgeInsets.all(5.w),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.r),
                topRight: Radius.circular(15.r),
              ),
            ),
            child: Column(
              children: [
                Text(
                  "Total: \$${totalPrice.toStringAsFixed(2)}",
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gap(5.h),
                customButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CartPage(),
                      ),
                    );
                  },
                  color: Colors.orange,
                  height: 40,
                  title: "Order Now",
                ),
              ],
            ),
          );
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search product",
                suffixIcon: const Icon(Icons.search),
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 2.h,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
            ),
            Gap(20.h),
            BlocConsumer<HomeBloc, HomeState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is FetchedProductLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is FetchedProductSuccess) {
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.productList.length,
                      itemBuilder: (context, index) {
                        final product = state.productList[index];
                        return productContainer(
                          cartButtonTap: () {
                            context
                                .read<CartBloc>()
                                .add(AddToCart(product: product));
                          },
                          image:
                              "https://cdn.pixabay.com/photo/2016/12/27/13/10/logo-1933884_640.png",
                          productName: product.name ?? "",
                          unitQuantity:
                              "${product.unitQty} ${product.unitName}",
                          stock: product.stock ?? "",
                          productPrice: product.price ?? "",
                        );
                      },
                    ),
                  );
                }
                if (state is FetchedProductFailure) {
                  return Center(
                    child: Text(state.error.toString()),
                  );
                }

                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
