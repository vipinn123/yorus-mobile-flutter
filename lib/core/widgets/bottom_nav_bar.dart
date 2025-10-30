// lib/core/widgets/bottom_nav_bar.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/icon_home_inactive.svg'),
          activeIcon: SvgPicture.asset('assets/icons/icon_home_active.svg'),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/icon_queue_inactive.svg'),
          activeIcon: SvgPicture.asset('assets/icons/icon_queue_active.svg'),
          label: 'Queue',
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/icon_done_inactive.svg'),
          activeIcon: SvgPicture.asset('assets/icons/icon_done_active.svg'),
          label: 'Done',
        ),
      ],
    );
  }
}
