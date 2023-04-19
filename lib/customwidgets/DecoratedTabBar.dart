import 'package:flutter/material.dart';

class DecoratedTabBar extends StatelessWidget implements PreferredSizeWidget {
  DecoratedTabBar({required this.tabBar, required this.decoration});

  final TabBar tabBar;
  final BoxDecoration decoration;

  @override
  Size get preferredSize => tabBar.preferredSize;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            decoration: decoration)),
        tabBar,
      ],
    );
  }
}