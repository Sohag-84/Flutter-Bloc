import 'package:e_commerce_task/common%20widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

Widget productContainer({
  required VoidCallback cartButtonTap,
  required String image,
  required String productName,
  required String unitQuantity,
  required String stock,
  required String productPrice,
}) {
  return Container(
    padding: EdgeInsets.symmetric(
      horizontal: 5.w,
      vertical: 5.h,
    ),
    margin: EdgeInsets.only(bottom: 10.h),
    decoration: BoxDecoration(
      border: Border.all(color: Colors.grey),
      borderRadius: BorderRadius.circular(8.r),
    ),
    child: Row(
      children: [
        Image.network(
          image,
          height: 100.h,
          width: 100.w,
        ),
        const Gap(8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                productName,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "Unit quantity: $unitQuantity  ||  stock: $stock",
              ),
              Text("Price: \$$productPrice"),
              customButton(
                onTap: cartButtonTap,
                title: "Add to Cart",
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
