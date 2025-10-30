// lib/core/widgets/main_scaffold.dart
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yorus_mobile/core/widgets/bottom_nav_bar.dart';

class MainScaffold extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainScaffold({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _calculateTitle(navigationShell.currentIndex),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implement Search
              print('Search button pressed');
            },
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.go('/settings'),
          ),
        ],
      ),
      body: navigationShell,
      bottomNavigationBar: BottomNavBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
      ),
    );
  }

  Widget _calculateTitle(int index) {
    String titleText;
    switch (index) {
      case 0:
        titleText = 'Yorus Home';
        break;
      case 1:
        titleText = 'My Queue';
        break;
      case 2:
        titleText = 'My Library';
        break;
      default:
        titleText = 'Yorus';
    }
    return Row(
      children: [
        SvgPicture.asset('assets/icons/logo.svg', height: 24, width: 24),
        const SizedBox(width: 8),
        Text(titleText),
      ],
    );
  }
}