import 'package:e_commerce/pallet/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    Center(child: Text("Category View")),
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
            appBar: AppBar(),
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
