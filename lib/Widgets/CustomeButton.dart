import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/AppTheme/AppColors.dart';
import '../core/provider/SettingProvider.dart';

class CustomeButton extends StatelessWidget {
  final String title;

  const CustomeButton({super.key, required this.title});

  Widget build(BuildContext context) {
    final provider = Provider.of<SettingProvider>(context);
    final theme = Theme.of(context).textTheme;
    return Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        color: provider.isDark() ? AppColors.green : AppColors.darkgreen,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          title,
          style: theme.titleMedium?.copyWith(
            fontSize: 20,
            color: provider.isDark() ? AppColors.black : AppColors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
