import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/AppTheme/AppColors.dart';
import '../../core/Classes/UserModel/UserModel.dart';
import '../../core/provider/SettingProvider.dart';

class PopulationCard extends StatelessWidget {
  final UserModel user;

  const PopulationCard({super.key, required this.user});

  Widget build(BuildContext context) {
    final provider = Provider.of<SettingProvider>(context);
    final theme = Theme.of(context).textTheme;

    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: provider.isDark() ? AppColors.green : AppColors.darkgreen,
          width: 1.5,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          spacing: 8,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${user.name}",
              style: theme.titleSmall?.copyWith(
                color: provider.isDark() ? AppColors.lighgrey : AppColors.black,
              ),
            ),
            Text(
              user.phone,
              style: theme.titleSmall?.copyWith(
                color: provider.isDark() ? AppColors.lighgrey : AppColors.black,
              ),
            ),
            Text(
              "apartmentNumber : ${user.apartmentNumber.toString()}",
              style: theme.titleSmall?.copyWith(
                color: provider.isDark() ? AppColors.lighgrey : AppColors.black,
              ),
            ),
            Text(
              user.isOwner ? "Owner" : "Tenant",
              style: theme.titleSmall?.copyWith(
                color: provider.isDark() ? AppColors.lighgrey : AppColors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
