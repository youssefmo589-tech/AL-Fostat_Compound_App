import 'package:alfostat/core/provider/SettingProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/AppTheme/AppColors.dart';

class BottomsheetContainer extends StatelessWidget {
  final Image image;

  bool isselected;

  int index;

  BottomsheetContainer({
    super.key,
    this.index = -1,
    required this.image,
    this.isselected = false,
  });

  Widget build(BuildContext context) {
    final provider = Provider.of<SettingProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: isselected == false
              ? Colors.transparent
              : provider.isDark()
              ? AppColors.green.withValues(alpha: 0.5)
              : AppColors.darkgreen.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: provider.isDark() ? AppColors.green : AppColors.darkgreen,
            width: 1.5,
          ),
        ),
        child: Center(
          child: Padding(padding: const EdgeInsets.all(8.0), child: image),
        ),
      ),
    );
  }
}
