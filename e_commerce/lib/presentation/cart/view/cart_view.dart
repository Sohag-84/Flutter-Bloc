import 'package:e_commerce/pallet/colors.dart';
import 'package:e_commerce/presentation/cart/widgets/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/checkout_button.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text(
          'Shopping Cart (12)',
          style: TextStyle(
            fontSize: 22.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: checkoutContainer(
        subtotal: "12",
        onTap: () {},
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return cartItem(
            incrementTap: () {},
            decrementTap: () {},
            deleteTap: () {},
            proImage: "https://t.ly/w8t9_",
            proName: "Banana",
            cartItemCount: 12,
            proPrice: "1234",
          );
        },
      ),
    );
  }
}
