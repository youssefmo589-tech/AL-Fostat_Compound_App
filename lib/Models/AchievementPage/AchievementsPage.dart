import 'package:alfostat/Models/AchievementPage/AchievementDetails.dart';
import 'package:alfostat/Models/HomePage/secionContainer.dart';
import 'package:alfostat/core/AppeRoutes/AppRouteName.dart';
import 'package:alfostat/core/FirebaseServices/FirestoreCloudServices/FirestoreCloudService.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../core/AppTheme/AppColors.dart';
import '../../core/Strings/Strings.dart';
import '../../core/l10n/app_localizations.dart';
import '../../core/provider/SettingProvider.dart';
import 'AchieveMentDataModel.dart';

class AchievementsPage extends StatefulWidget {
  const AchievementsPage({super.key});

  State<AchievementsPage> createState() => _AchievementsPageState();
}

class _AchievementsPageState extends State<AchievementsPage> {
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final provider = Provider.of<SettingProvider>(context);
    final theme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 30,
              color: provider.isDark() ? AppColors.green : AppColors.darkgreen,
            ),
          ),
          title: Text(locale!.achievements, style: TextStyle(
              color: provider.isDark() ? AppColors.green : AppColors
                  .darkgreen),),
          centerTitle: true,


        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: StreamBuilder(

              stream: FireStoreCloudService.getrealtimeallachievement(),

              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return ListView.separated(
                      itemBuilder: (cotext, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Skeletonizer(child: Bone(
                            height: 220, width: double.infinity,

                          )),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return SizedBox(height: 16,);
                      },
                      itemCount: 4);
                }
                if (snapshot.hasError) {
                  return Text(snapshot.hasError.toString());
                }
                List<AchievementDataModel> achievements = snapshot.data!;

                return achievements.isEmpty ? Center(
                    child: Lottie.asset(Strings.LottieEmpty)) : ListView
                    .separated(
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => AchievementDetails(),
                              settings: RouteSettings(
                                  arguments: achievements[index])));
                        },
                        child: SectionContainer(
                            image: provider.isDark() ? achievements[index]
                                .image ?? Strings.AcheivementContainerdark :
                            achievements[index].image ??
                                Strings.AcheivementContainerlight,
                            title: achievements[index].title),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(height: 16,);
                    },
                    itemCount: achievements.length

                );
              }


          ),
        ),

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
                color: provider.isDark() ? AppColors.green : AppColors
                    .darkgreen,
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
      ),
    );
  }
}
