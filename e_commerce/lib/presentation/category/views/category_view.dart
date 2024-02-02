import 'package:e_commerce/config/app_config.dart';
import 'package:e_commerce/pallet/colors.dart';
import 'package:e_commerce/presentation/category/bloc/category_bloc.dart';
import 'package:e_commerce/presentation/category/widgets/product_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    context.read<CategoryBloc>().add(CategoryProductFetchedEvent());
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
      body: BlocBuilder<CategoryBloc, CategoryState>(
        builder: (context, state) {
          if (state is CategoryProductFailureState) {
            return Center(child: Text(state.errorMsg));
          }
          if (state is! CategoryProductSuccessState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return GridView.builder(
            itemCount: state.productList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.w,
              mainAxisSpacing: 10.h,
              mainAxisExtent: 270.h,
            ),
            itemBuilder: (context, index) {
              final data = state.productList[index];
              return productContainer(
                isButtonClicked: data.isBtnClicked,
                incrementTap: () {},
                decrementTap: () {},
                addToCartTap: () {},
                cartItem: 12,
                proImage: "${AppConfig.imgBaseURL}${data.image}",
                proDiscountImage: "assets/images/discount.png",
                proDiscount: data.discountType == "percentage"
                    ? "${data.discountAmount}% OFF"
                    : data.discountType == "fixedAmount"
                        ? "TAKA ${data.discountAmount} OFF"
                        : null,
                plasticStatus: "PLASTIC FREE",
                proStock: data.quantity!,
                proName: "${data.name}",
                proWeight: "${data.weight} kg",
                proNewPrice: "${data.price}",
                proOldPrice: "150",
              );
            },
          );
        },
      ),
    );
  }
}
