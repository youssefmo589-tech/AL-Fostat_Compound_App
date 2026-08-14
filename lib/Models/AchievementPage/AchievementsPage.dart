import 'package:alfostat/core/AppeRoutes/AppRouteName.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/AppTheme/AppColors.dart';
import '../../core/gen/assets.gen.dart';
import '../../core/provider/SettingProvider.dart';

class AchievementsPage extends StatefulWidget {
  const AchievementsPage({super.key});

  State<AchievementsPage> createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage> {
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingProvider>(context);
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios_new,
            size: 30,
            color: provider.isDark() ? AppColors.green : AppColors.darkgreen,
          ),
        ),
        title: SizedBox(
          width: 200,
          height: 35,
          child: provider.isDark()
              ? Assets.images.fostatpagelogogreen.image()
              : Assets.images.fostatpageLogoBlack.image(),
        ),
        centerTitle: true,
      ),

      body: Column(),

      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, AppRouteName.AddAchievement);
        },
        child: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: provider.isDark() ? AppColors.green : AppColors.darkgreen,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: provider.isDark()
                      ? AppColors.green
                      : AppColors.darkgreen,
                  blurRadius: 12,
                  spreadRadius: 2,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Icon(
              Icons.add,
              size: 24,
              color: provider.isDark() ? AppColors.black : Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
