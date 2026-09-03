import 'package:alfostat/Models/Onboarding/OnBoardingModel.dart';
import 'package:alfostat/Widgets/CustomeButton.dart';
import 'package:alfostat/core/provider/SettingProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/AppTheme/AppColors.dart';
import '../../core/AppeRoutes/AppRouteName.dart';
import '../../core/l10n/app_localizations.dart';
import 'SharedprefService.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  int _selectedindex = 0;

  PageController controller = PageController();

  List<OnBoardingModel> pages = [
    OnBoardingModel(
      title: "Your Community, One App",
      description:
          "Stay connected with everything happening in your residential community. Follow updates, achievements, and important announcements.",
      image: "assets/images/onboarding page1.png",
    ),
    OnBoardingModel(
      title: "See What's Happening",
      description:
          "Keep up with the latest developments, improvements, and achievements in your community",
      image: "assets/images/onboarding page2.png",
    ),
    OnBoardingModel(
      title: "Your Voice Matters",
      description:
          "Submit your complaints and suggestions easily, and stay updated on their progress.",
      image: "assets/images/onboardingpage3.png",
    ),
  ];

  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final provider = Provider.of<SettingProvider>(context);
    final theme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          leading: _selectedindex != 0
              ? GestureDetector(
                  onTap: () {
                    controller.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: provider.isDark()
                        ? AppColors.green
                        : AppColors.darkgreen,
                    size: 24,
                  ),
                )
              : SizedBox(),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                width: 63,
                height: 32,
                decoration: BoxDecoration(
                  color: provider.isDark() ? Colors.black : AppColors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: provider.isDark()
                        ? AppColors.green
                        : AppColors.darkgreen,
                    width: 1.5,
                  ),
                ),
                child: Center(
                  child: GestureDetector(
                    onTap: () {
                      SharePrefService.setSeen();
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRouteName.LoginPage,
                        (route) => false,
                      );
                    },
                    child: Text(
                      locale!.skip,
                      style: theme.titleLarge?.copyWith(
                        fontSize: 14,
                        color: provider.isDark()
                            ? AppColors.green
                            : AppColors.darkgreen,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  setState(() {
                    _selectedindex = index;
                  });
                },
                itemCount: pages.length,
                controller: controller,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(
                      right: 16,
                      left: 16,
                      bottom: 16,
                    ),
                    child: Column(
                      children: [
                        Image.asset(pages[index].image),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            pages.length,
                            (index) => Container(
                              width: _selectedindex == index ? 20 : 8,
                              height: 8,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(36),
                                color: provider.isDark()
                                    ? _selectedindex == index
                                          ? AppColors.green
                                          : AppColors.lighgreyev
                                    : _selectedindex == index
                                    ? AppColors.darkgreen
                                    : AppColors.darkgrey,
                              ),
                              margin: EdgeInsets.symmetric(horizontal: 4),
                            ),
                          ),
                        ),
                        SizedBox(height: 24),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 8,
                          children: [
                            Text(
                              pages[index].title,
                              style: theme.titleLarge?.copyWith(
                                fontSize: 20,
                                color: provider.isDark()
                                    ? AppColors.white
                                    : AppColors.black,
                              ),
                            ),
                            Text(
                              pages[index].description,
                              style: theme.titleSmall?.copyWith(
                                fontSize: 16,
                                color: provider.isDark()
                                    ? AppColors.green
                                    : AppColors.darkgreen,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: GestureDetector(
                onTap: () {
                  if (_selectedindex == pages.length - 1) {
                    SharePrefService.setSeen();
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRouteName.LoginPage,
                      (route) => false,
                    );
                  } else {
                    controller.nextPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: _selectedindex == pages.length - 1
                    ? CustomeButton(title: locale.finish)
                    : CustomeButton(title: locale.next),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
