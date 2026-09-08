import 'package:alfostat/Models/HomePage/secionContainer.dart';
import 'package:alfostat/core/Strings/Strings.dart';
import 'package:alfostat/core/provider/SettingProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/AppTheme/AppColors.dart';
import '../../core/AppeRoutes/AppRouteName.dart';
import '../../core/Classes/UserModel/UserModel.dart';
import '../../core/FirebaseServices/FirestoreCloudServices/FireCloudServiceToUser.dart';
import '../../core/gen/assets.gen.dart';
import '../../core/l10n/app_localizations.dart';
import '../Onboarding/SharedprefService.dart';
import 'CategoryModel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = [
    CategoryModel(
      imagelight: Strings.AchievementLight,
      imagedark: Strings.AchievementBlack,
      title: Strings.AchievementTitle,
    ),
    // CategoryModel(
    //   imagelight: Strings.MonthlyLight,
    //   imagedark: Strings.MonthlyBlack,
    //   title: Strings.MonthlyTitle,
    // ),
    CategoryModel(
      imagelight: Strings.complaintimagewhite,
      imagedark: Strings.complaintimageblack,
      title: Strings.ComplaintTitle,
    ),
  ];

  Future<UserModel> loaduser() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final user = await FireStoreCloudServiceUser.getuser(uid);
    return user!;
  }

  UserModel? user;

  Future<void> Loaduserdata() async {
    final data = await loaduser();
    setState(() {
      user = data;
    });
  }

  void initState() {
    super.initState();
    Loaduserdata();
  }

  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);

    final theme = Theme.of(context).textTheme;
    final provider = Provider.of<SettingProvider>(context);
    return Padding(
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
                        "${locale!.welcomeBack}✨",
                        style: theme.titleSmall?.copyWith(
                          color: provider.isDark()
                              ? AppColors.green
                              : AppColors.darkgrey,
                        ),
                      ),
                      Text(
                        user?.name ?? "Loading...",
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
                                SharePrefService.settheme("light");

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
                                SharePrefService.settheme("dark");

                                provider.changeTheme(ThemeMode.dark);
                              },
                              child: Icon(
                                Icons.wb_sunny_outlined,
                                color: AppColors.black,
                                size: 24,
                              ),
                            ),
                    user?.image == null
                        ? CircleAvatar(
                            radius: 15,
                            backgroundColor: AppColors.lighgreyev,
                            child: Icon(
                              Icons.person,
                              color: AppColors.darkgrey,
                              size: 20,
                            ),
                          )
                        : CircleAvatar(
                            radius: 15,
                            backgroundImage: AssetImage(user!.image!),
                          ),
                  ]),
                ],
              ),
              SizedBox(height: 20),
              Text(
                locale.categories,
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
                      // if (index == 1) {
                      //   Navigator.pushNamed(
                      //     context,
                      //     AppRouteName.Subscriptionpage,
                      //   );
                      // }
                      if (index == 1) {
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
    );
  }
}
