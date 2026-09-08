import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../core/AppTheme/AppColors.dart';
import '../core/provider/SettingProvider.dart';

class CustomeDropdownWidget extends StatelessWidget {
  final String hinttxt;

  final List<String> items;

  final Function(String) onChanged;

  const CustomeDropdownWidget({
    super.key,
    required this.hinttxt,
    required this.items,
    required this.onChanged,
  });

  Widget build(BuildContext context) {
    final provider = Provider.of<SettingProvider>(context);
    final theme = Theme.of(context).textTheme;

    return CustomDropdown<String>(
      decoration: CustomDropdownDecoration(
        listItemStyle: TextStyle(
          color: AppColors.black,
          fontSize: 16,
          fontWeight: FontWeight.w400,
        ),
        headerStyle: TextStyle(
          color: provider.isDark() ? AppColors.lighgrey : AppColors.lighgreyev,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        hintStyle: TextStyle(
          color: provider.isDark() ? AppColors.lighgrey : AppColors.lighgreyev,
          fontSize: 14,
          fontWeight: FontWeight.w400,
        ),
        closedSuffixIcon: Icon(
          Icons.keyboard_double_arrow_down,
          color: provider.isDark() ? AppColors.lighgrey : AppColors.darkgreen,
          size: 24,
        ),
        closedFillColor: provider.isDark() ? AppColors.black : AppColors.white,
        closedBorderRadius: BorderRadius.circular(16),
        closedBorder: Border.all(
          color: provider.isDark() ? AppColors.green : AppColors.darkgreen,
        ),
      ),
      hintText: hinttxt,
      items: items,
      animation: const CustomDropdownAnimation(
        type: DropdownAnimationType.scaleFade,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeOutCubic,
        staggerItems: true,
      ),
      onChanged: (value) {
        if (value != null) {
          onChanged(value);
        }
      },
    );
  }
}
