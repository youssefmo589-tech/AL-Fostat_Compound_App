import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/AppTheme/AppColors.dart';
import '../../core/provider/SettingProvider.dart';

class ProfileCard extends StatelessWidget {
  final String? title;

  const ProfileCard({super.key, required this.title});

  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final provider = Provider.of<SettingProvider>(context);
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: provider.isDark() ? AppColors.green : AppColors.darkgreen,
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Text(
          title ?? "",
          style: theme.titleSmall?.copyWith(
            color: provider.isDark() ? AppColors.lighgrey : AppColors.darkgrey,
          ),
        ),
      ),
    );
  }
}
