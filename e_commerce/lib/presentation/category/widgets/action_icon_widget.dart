import 'package:e_commerce/pallet/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Container actionIconWidget({required IconData icon}) {
  return Container(
    padding: EdgeInsets.all(5.w),
    decoration: BoxDecoration(
      color: AppColors.whiteColor,
      shape: BoxShape.circle,
    ),
    child: Icon(icon),
  );
}