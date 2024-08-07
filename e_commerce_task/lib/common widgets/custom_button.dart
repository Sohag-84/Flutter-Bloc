import 'package:e_commerce_task/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customButton({
  required VoidCallback onTap,
  required String title,
  Color color = AppColors.primaryColor,
  double height = 35.0,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: height.h,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        title,
        style: const TextStyle(color: AppColors.whiteColor),
      ),
    ),
  );
}
