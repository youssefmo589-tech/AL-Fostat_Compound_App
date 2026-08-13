import 'package:alfostat/core/provider/SettingProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../AppTheme/AppColors.dart';

class TabBarItem extends StatelessWidget {
  final bool isselected;

  final String BuildingNum;

  const TabBarItem({
    required this.isselected,
    required this.BuildingNum,
    super.key,
  });

  Widget build(BuildContext context) {
    final provider = Provider.of<SettingProvider>(context);
    final theme = Theme.of(context).textTheme;
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: isselected
            ? provider.isDark()
                  ? AppColors.green
                  : AppColors.darkgreen
            : provider.isDark()
            ? AppColors.lighgrey
            : AppColors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          spacing: 8,
          children: [
            Icon(
              Icons.meeting_room_outlined,
              size: 24,
              color: isselected
                  ? provider.isDark()
                        ? AppColors.black
                        : AppColors.white
                  : provider.isDark()
                  ? AppColors.darkgreen
                  : AppColors.black,
            ),
            Text(
              BuildingNum,
              style: theme.titleMedium?.copyWith(
                fontSize: 16,
                color: isselected
                    ? provider.isDark()
                          ? AppColors.black
                          : AppColors.white
                    : provider.isDark()
                    ? AppColors.darkgreen
                    : AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
