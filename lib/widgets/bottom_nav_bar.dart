import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../utilities/colors.dart';

Widget myBottomNavBar({
  required BuildContext context,
  required List<IconData> icon,
  required activeIndex,
  required dynamic Function(int) onTap,
}) {
  return AnimatedBottomNavigationBar(
    backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
    borderColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
    icons: icon,
    activeIndex: activeIndex,
    onTap: onTap,
    gapLocation: GapLocation.none,
    notchSmoothness: NotchSmoothness.verySmoothEdge,
    leftCornerRadius: 32,
    rightCornerRadius: 32,
    splashColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
    activeColor: Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
    inactiveColor:
        Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
    //other params
  );
}
