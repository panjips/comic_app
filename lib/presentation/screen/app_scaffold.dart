import 'package:comic_app/presentation/bloc/comic/comic_bloc.dart';
import 'package:comic_app/utils/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class AppScaffold extends StatefulWidget {
  final Widget child;
  const AppScaffold({super.key, required this.child});

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  static final _items = <SalomonBottomBarItem>[
    SalomonBottomBarItem(
      title: const Text(
        "Home",
        style: TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
        ),
      ),
      icon: const Icon(Icons.home),
    ),
    SalomonBottomBarItem(
      title: const Text(
        "Explore",
        style: TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
        ),
      ),
      icon: const Icon(Icons.explore),
    ),
    SalomonBottomBarItem(
      title: const Text(
        "Favorite",
        style: TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
        ),
      ),
      icon: const Icon(Icons.favorite),
    ),
    SalomonBottomBarItem(
      title: const Text(
        "Profile",
        style: TextStyle(
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
        ),
      ),
      icon: const Icon(Icons.person),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: slate[950],
      body: widget.child,
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: slate[800],
        selectedItemColor: indigo[500],
        unselectedItemColor: slate[300],
        margin: EdgeInsets.symmetric(vertical: 14.sp, horizontal: 20.sp),
        itemShape:
            BeveledRectangleBorder(borderRadius: BorderRadius.circular(10.sp)),
        itemPadding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 12.sp),
        items: _items,
        onTap: onTap,
        currentIndex: _calculateSelectedIndex(context),
      ),
    );
  }

  int _calculateSelectedIndex(BuildContext context) {
    final GoRouter route = GoRouter.of(context);
    final String location =
        route.routerDelegate.currentConfiguration.uri.toString();
    if (location.startsWith('/home')) {
      return 0;
    }
    if (location.startsWith('/explore')) {
      return 1;
    }
    if (location.startsWith('/favorite')) {
      return 2;
    }
    if (location.startsWith('/profile')) {
      return 3;
    }
    return 0;
  }

  void onTap(int value) {
    switch (value) {
      case 0:
        return context.go('/home');
      case 1:
        return context.go('/explore');
      case 2:
        return context.go('/favorite');
      case 3:
        return context.go('/profile');
      default:
        return context.go('/home');
    }
  }
}
