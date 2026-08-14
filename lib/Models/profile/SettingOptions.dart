import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/AppTheme/AppColors.dart';
import '../../core/provider/SettingProvider.dart';

class SettingOptions extends StatefulWidget {
  final String Optionname;

  final Widget optionicon;

  const SettingOptions({
    super.key,
    required this.Optionname,
    required this.optionicon,
  });

  State<SettingOptions> createState() => _SettingOptionsState();
}

class _SettingOptionsState extends State<SettingOptions> {
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final provider = Provider.of<SettingProvider>(context);
    return Container(
      height: 48,
      width: double.infinity,
      decoration: BoxDecoration(
        color: provider.isDark() ? AppColors.black : AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: provider.isDark() ? AppColors.green : AppColors.darkgreen,
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.Optionname,
              style: theme.titleMedium?.copyWith(
                color: provider.isDark() ? AppColors.white : AppColors.black,
                fontSize: 16,
              ),
            ),
            widget.optionicon,
          ],
        ),
      ),
    );
  }
}
