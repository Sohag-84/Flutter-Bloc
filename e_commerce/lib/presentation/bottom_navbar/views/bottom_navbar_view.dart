import 'package:badges/badges.dart' as badges;
import 'package:e_commerce/pallet/colors.dart';
import 'package:e_commerce/presentation/category/views/category_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/bottom_nav_bloc.dart';
import '../widgets/navbar_icon.dart';

class BottomNavbarView extends StatefulWidget {
  const BottomNavbarView({super.key});

  @override
  State<BottomNavbarView> createState() => _BottomNavbarViewState();
}

class _BottomNavbarViewState extends State<BottomNavbarView> {
  final List pages = const [
    Center(child: Text("Home View")),
    CategoryView(),
    Center(child: Text("Search View")),
    Center(child: Text("Menu View")),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BottomNavBloc, BottomNavState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is BottomNavInitialState) {
          return Scaffold(
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: InkWell(
              onTap: () {},
              child: Container(
                height: 75.h,
                width: 75.w,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.pirmaryColor,
                  shape: BoxShape.circle,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 8.h),
                    badges.Badge(
                      position: badges.BadgePosition.topEnd(top: -10, end: -12),
                      badgeContent: Text(
                        "12",
                        style: TextStyle(
                          color: AppColors.pirmaryColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      badgeStyle: badges.BadgeStyle(
                        badgeColor: AppColors.whiteColor,
                      ),
                      child: Icon(
                        Icons.shopping_cart_outlined,
                        color: AppColors.whiteColor,
                        size: 25.h,
                      ),
                    ),
                    Text(
                      '৳ 2450',
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomAppBar(
              color: AppColors.whiteColor,
              elevation: 1,
              child: Row(
                children: [
                  //home
                  Expanded(
                    flex: 1,
                    child: navbarIcon(
                      onTap: () {
                        context
                            .read<BottomNavBloc>()
                            .add(BottomNavPageIndexChangedEvent(pageIndex: 0));
                      },
                      icon: Icons.home_sharp,
                      label: "Home",
                      color: state.currentIndex == 0
                          ? AppColors.pirmaryColor
                          : AppColors.greyColor,
                    ),
                  ),
                  //category
                  Expanded(
                    flex: 1,
                    child: navbarIcon(
                      onTap: () {
                        context
                            .read<BottomNavBloc>()
                            .add(BottomNavPageIndexChangedEvent(pageIndex: 1));
                      },
                      icon: Icons.dashboard,
                      label: "Category",
                      color: state.currentIndex == 1
                          ? AppColors.pirmaryColor
                          : AppColors.greyColor,
                    ),
                  ),

                  Expanded(flex: 1, child: Container()),
                  //search
                  Expanded(
                    flex: 1,
                    child: navbarIcon(
                      onTap: () {
                        context
                            .read<BottomNavBloc>()
                            .add(BottomNavPageIndexChangedEvent(pageIndex: 2));
                      },
                      icon: Icons.search,
                      label: "Search",
                      color: state.currentIndex == 2
                          ? AppColors.pirmaryColor
                          : AppColors.greyColor,
                    ),
                  ),
                  //menu
                  Expanded(
                    flex: 1,
                    child: navbarIcon(
                      onTap: () {
                        context
                            .read<BottomNavBloc>()
                            .add(BottomNavPageIndexChangedEvent(pageIndex: 3));
                      },
                      icon: Icons.menu,
                      label: "Menu",
                      color: state.currentIndex == 3
                          ? AppColors.pirmaryColor
                          : AppColors.greyColor,
                    ),
                  ),
                ],
              ),
            ),
            body: pages[state.currentIndex],
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
