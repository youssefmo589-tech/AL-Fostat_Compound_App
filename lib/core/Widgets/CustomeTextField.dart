import 'package:alfostat/core/provider/SettingProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../AppTheme/AppColors.dart';

class CustomeTextField extends StatefulWidget {
  final String hinttxt;

  final String? Function(String?)? validator;

  final TextEditingController controller;

  final Widget? suffixIcon;

  final Widget? prefixIcon;

  bool obscureText;

  CustomeTextField({
    super.key,
    required this.hinttxt,
    required this.validator,
    required this.controller,
    this.suffixIcon,
    this.prefixIcon,
    this.obscureText = false,
  });

  State<CustomeTextField> createState() => _CustomeTextFieldState();
}

class _CustomeTextFieldState extends State<CustomeTextField> {
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingProvider>(context);
    final theme = Theme.of(context).textTheme;

    return SizedBox(
      width: double.infinity,
      height: 48,
      child: TextFormField(
        obscureText: widget.obscureText,
        controller: widget.controller,
        cursorColor: provider.isDark() ? AppColors.green : AppColors.darkgreen,
        style: theme.titleSmall?.copyWith(
          color: provider.isDark() ? AppColors.lighgrey : AppColors.darkgrey,
        ),
        validator: widget.validator,
        autovalidateMode: AutovalidateMode.onUnfocus,
        decoration: InputDecoration(
          suffixIcon: widget.suffixIcon,
          prefixIcon: widget.prefixIcon,
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          hintText: widget.hinttxt,
          hintStyle: theme.titleSmall?.copyWith(
            color: provider.isDark() ? AppColors.lighgrey : AppColors.darkgrey,
          ),
          filled: true,
          fillColor: provider.isDark() ? Colors.transparent : AppColors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: provider.isDark() ? AppColors.green : AppColors.darkgreen,
              width: 1.5,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: BorderSide(
              color: provider.isDark() ? AppColors.green : AppColors.darkgreen,
              width: 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
