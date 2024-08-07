import 'package:e_commerce_task/common%20widgets/custom_button.dart';
import 'package:e_commerce_task/data/local_preference.dart';
import 'package:e_commerce_task/pages/home/bloc/home_bloc.dart';
import 'package:e_commerce_task/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';

import '../widgets/product_container.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
      bottomNavigationBar: Container(
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
              "Total: \$10000",
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            Gap(5.h),
            customButton(
              onTap: () {},
              color: Colors.orange,
              height: 40,
              title: "Order Now",
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(
          children: [
            TextField(
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
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return productContainer(
                    cartButtonTap: () {},
                    image:
                        "https://cdn.pixabay.com/photo/2016/12/27/13/10/logo-1933884_640.png",
                    productName: "Soybean 2 Ltr",
                    unitQuantity: "1Kg",
                    stock: "1024.0",
                    productPrice: "200.00",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
