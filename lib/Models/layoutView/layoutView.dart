import 'package:alfostat/core/provider/SettingProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/AppTheme/AppColors.dart';
import '../HomePage/Home.dart';
import '../Population/Population.dart';
import '../profile/profile.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  int _currentindex = 0;

  List<Widget> pages = [Home(), Population(), Profile()];

  Widget build(BuildContext context) {
    final provider = Provider.of<SettingProvider>(context);
    final theme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: pages[_currentindex],

        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            setState(() {
              _currentindex = index;
            });
          },
          currentIndex: _currentindex,
          backgroundColor: provider.isDark()
              ? AppColors.black
              : AppColors.lighgrey,
          selectedItemColor: provider.isDark()
              ? AppColors.green
              : AppColors.darkgreen,
          selectedLabelStyle: theme.titleSmall?.copyWith(
            color: provider.isDark() ? AppColors.green : AppColors.darkgreen,
            fontSize: 12,
          ),
          unselectedItemColor: provider.isDark()
              ? AppColors.lighgrey
              : AppColors.darkgrey,
          unselectedLabelStyle: theme.titleSmall?.copyWith(
            color: provider.isDark() ? AppColors.lighgrey : AppColors.darkgrey,
            fontSize: 12,
          ),

          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home_filled,
                size: 24,
                color: provider.isDark()
                    ? AppColors.lighgrey
                    : AppColors.darkgrey,
              ),
              label: "Home",
              activeIcon: Icon(
                Icons.home_filled,
                size: 24,
                color: provider.isDark()
                    ? AppColors.green
                    : AppColors.darkgreen,
              ),
            ),

            BottomNavigationBarItem(
              icon: Icon(
                Icons.people_outline,
                size: 24,
                color: provider.isDark()
                    ? AppColors.lighgrey
                    : AppColors.darkgrey,
              ),
              label: "Population",
              activeIcon: Icon(
                Icons.people_outline,
                size: 24,
                color: provider.isDark()
                    ? AppColors.green
                    : AppColors.darkgreen,
              ),
            ),

            BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
                size: 24,
                color: provider.isDark()
                    ? AppColors.lighgrey
                    : AppColors.darkgrey,
              ),
              label: "Profile",
              activeIcon: Icon(
                Icons.person_outline,
                size: 24,
                color: provider.isDark()
                    ? AppColors.green
                    : AppColors.darkgreen,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
