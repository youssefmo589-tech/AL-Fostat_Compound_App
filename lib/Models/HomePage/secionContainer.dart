import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/AppTheme/AppColors.dart';
import '../../core/provider/SettingProvider.dart';

class SectionContainer extends StatefulWidget {
  final String ? image;

  final String? title;

  const SectionContainer({super.key, this.image, this.title});

  State<SectionContainer> createState() => _SectionContainerState();
}

class _SectionContainerState extends State<SectionContainer> {
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final provider = Provider.of<SettingProvider>(context);

    return Container(
      height: 193,
      width: double.infinity,
      decoration: BoxDecoration(
        color: provider.isDark() ? AppColors.black : AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.green, width: 2),
          image: widget.image != null ? DecorationImage(
            image: AssetImage(widget.image!),
          fit: BoxFit.cover,
          ) : null
      ),
      child: Column(
        children: [
          Spacer(),
          Padding(
            padding: const EdgeInsets.all(16),
            child: widget.title == null
                ? SizedBox()
                : Container(
                    width: double.infinity,
              decoration: BoxDecoration(
                color: provider.isDark()
                    ? AppColors.black.withValues(alpha: 0.8)
                    : AppColors.lighgrey.withValues(alpha: 0.8),
                border: Border.all(color: AppColors.green, width: 2),
                borderRadius: BorderRadius.circular(16),
              ),
              child:
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                            widget.title!,
                            style: theme.titleMedium?.copyWith(
                        color: provider.isDark()
                            ? AppColors.white
                            : AppColors.black,
                      ),
                    ),
                  ),

            ),
          ),
        ],
      ),
    );
  }
}
