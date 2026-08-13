import 'package:alfostat/core/Models/HomePage/CategoryModel.dart';
import 'package:alfostat/core/Models/HomePage/secionContainer.dart';
import 'package:alfostat/core/Strings/Strings.dart';
import 'package:alfostat/core/provider/SettingProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../AppTheme/AppColors.dart';
import '../../AppeRoutes/AppRouteName.dart';
import '../../gen/assets.gen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget build(BuildContext context) {
    List<CategoryModel> categories = [
      CategoryModel(
        imagelight: Strings.AchievementLight,
        imagedark: Strings.AchievementBlack,
        title: Strings.AchievementTitle,
      ),
      CategoryModel(
        imagelight: Strings.MonthlyLight,
        imagedark: Strings.MonthlyBlack,
        title: Strings.MonthlyTitle,
      ),
      CategoryModel(
        imagelight: Strings.complaintimagewhite,
        imagedark: Strings.complaintimageblack,
        title: Strings.ComplaintTitle,
      ),
    ];
    final theme = Theme.of(context).textTheme;
    final provider = Provider.of<SettingProvider>(context);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome Back ✨",
                        style: theme.titleSmall?.copyWith(
                          color: provider.isDark()
                              ? AppColors.green
                              : AppColors.darkgrey,
                        ),
                      ),
                      Text(
                        "Youssef Mohamed",
                        style: theme.titleMedium?.copyWith(
                          color: provider.isDark()
                              ? AppColors.white
                              : AppColors.black,
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      provider.isDark()
                          ? GestureDetector(
                              onTap: () {
                                provider.changeTheme(ThemeMode.light);
                              },
                              child: Assets.icons.moonSvgrepoCom.svg(
                                colorFilter: ColorFilter.mode(
                                  AppColors.green,
                                  BlendMode.srcIn,
                                ),
                                width: 24,
                                height: 24,
                              ),
                            )
                          : GestureDetector(
                              onTap: () {
                                provider.changeTheme(ThemeMode.dark);
                              },
                              child: Icon(
                                Icons.wb_sunny_outlined,
                                color: AppColors.black,
                                size: 24,
                              ),
                            ),

                      ///// lannnnnnnnnnnnnn
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                "Categories",
                style: theme.titleLarge?.copyWith(
                  color: provider.isDark()
                      ? AppColors.green
                      : AppColors.darkgreen,
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 20),
              ListView.separated(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (index == 0) {
                        Navigator.pushNamed(
                          context,
                          AppRouteName.AchievementsPage,
                        );
                      }
                      if (index == 1) {
                        Navigator.pushNamed(
                          context,
                          AppRouteName.Subscriptionpage,
                        );
                      }
                      if (index == 2) {
                        Navigator.pushNamed(
                          context,
                          AppRouteName.ComplaintPage,
                        );
                      }
                    },
                    child: SectionContainer(
                      image: provider.isDark()
                          ? categories[index].imagedark
                          : categories[index].imagelight,
                      title: categories[index].title,
                    ),
                  );
                },

                separatorBuilder: (context, index) {
                  return SizedBox(height: 16);
                },

                itemCount: categories.length,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
