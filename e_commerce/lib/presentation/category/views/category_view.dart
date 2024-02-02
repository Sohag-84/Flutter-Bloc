import 'package:e_commerce/data/repository/category_repository.dart';
import 'package:e_commerce/pallet/colors.dart';
import 'package:e_commerce/presentation/category/widgets/product_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../widgets/action_icon_widget.dart';

class CategoryView extends StatefulWidget {
  const CategoryView({super.key});

  @override
  State<CategoryView> createState() => _CategoryViewState();
}

class _CategoryViewState extends State<CategoryView> {
  @override
  void initState() {
    super.initState();
    CategoryRepository().getCategoryProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        title: Text(
          "Fruits & Vegetables",
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          actionIconWidget(
            icon: Icons.dark_mode_outlined,
          ),
          SizedBox(width: 10.w),
          actionIconWidget(
            icon: Icons.favorite_border,
          ),
          SizedBox(width: 5.w),
        ],
      ),
      body: GridView.builder(
        itemCount: 10,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.w,
          mainAxisSpacing: 10.h,
          mainAxisExtent: 270.h,
        ),
        itemBuilder: (context, index) {
          return productContainer(
            isButtonClicked: false,
            incrementTap: () {},
            decrementTap: () {},
            addToCartTap: () {},
            cartItem: 12,
            proImage: "https://t.ly/r-SWt",
            proDiscountImage: "assets/images/discount.png",
            proDiscount: "23",
            plasticStatus: "Plastic Free",
            proStock: 12,
            proName: "Banana Plastic Free Plastic Free Plastic Free",
            proWeight: "34",
            proNewPrice: "23",
            proOldPrice: "556",
          );
        },
      ),
    );
  }
}
