import 'package:alfostat/Widgets/CustomeButton.dart';
import 'package:alfostat/core/l10n/app_localizations.dart';
import 'package:alfostat/core/provider/SettingProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/AppTheme/AppColors.dart';
import '../../core/AppeRoutes/AppRouteName.dart';
import '../../core/gen/assets.gen.dart';
import 'SharedprefService.dart';

class letsStart extends StatefulWidget {
  const letsStart({super.key});

  State<letsStart> createState() => _letsStartState();
}

class _letsStartState extends State<letsStart> {
  bool issun = true;

  bool isen = true;

  void initState() {
    final provider = Provider.of<SettingProvider>(context, listen: false);

    if (provider.isDark()) {
      issun = false;
    }
    else {
      issun = true;
    }

    if (provider.currentLocale == Locale("en")) {
      isen = true;
    }
    else {
      isen = false;
    }
  }



  Widget build(BuildContext context) {
    final provider = Provider.of<SettingProvider>(context);
    final locale = AppLocalizations.of(context);

    final theme = Theme
        .of(context)
        .textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(

          title: Padding(
            padding: const EdgeInsets.all(80),
            child: provider.isDark()
                ? Assets.icons.logoTextblack01.svg(
                colorFilter: ColorFilter.mode(AppColors.green, BlendMode.srcIn))
                : Assets.icons.logoTextdarkgreen01.svg(
                colorFilter: ColorFilter.mode(
                    AppColors.darkgreen, BlendMode.srcIn)),
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Assets.images.letsStart.image(),
              SizedBox(height: 24,),
              Text(
                locale!.welcomeToYourCommunity,
                style: theme.titleLarge?.copyWith(
                    fontSize: 20,
                    color: provider.isDark() ? AppColors.white : Colors
                        .black),),
              SizedBox(height: 8,),
              Text(
                locale.welcomeSubTitle,
                style: theme.titleSmall?.copyWith(
                  fontSize: 16,
                  color: provider.isDark()
                      ? AppColors.green
                      : AppColors.darkgreen,
                ),),
              SizedBox(height: 16,),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(locale.language, style: theme.titleMedium?.copyWith(
                      fontSize: 18,
                      color: provider.isDark() ? AppColors.green : AppColors
                          .darkgreen),),
                  Row(
                    spacing: 8,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            provider.changedlan(Locale("en"));
                            SharePrefService.setlanguage("en");
                            isen = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: isen ? provider.isDark()
                                  ? AppColors.green
                                  : AppColors.darkgreen : provider.isDark()
                                  ? Colors.black
                                  : AppColors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: isen ? provider.isDark() ? AppColors
                                      .white : AppColors.green : provider
                                      .isDark()
                                      ? Colors.grey
                                      : AppColors.lighgreyev
                              )


                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(locale.english, style: theme.titleSmall
                                ?.copyWith(fontSize: 14,
                              color: isen ? provider.isDark()
                                  ? AppColors.black
                                  : AppColors.white : provider.isDark()
                                  ? AppColors.green
                                  : AppColors.darkgreen,)),
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            provider.changedlan(Locale("ar"));
                            SharePrefService.setlanguage("ar");

                            isen = false;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: isen == false ? provider.isDark()
                                  ? AppColors
                                  .green
                                  : AppColors.darkgreen : provider.isDark()
                                  ? Colors.black
                                  : AppColors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: isen == false ? provider.isDark()
                                      ? AppColors.white
                                      : AppColors.green : provider.isDark()
                                      ? Colors.grey
                                      : AppColors.lighgreyev
                              )


                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(locale.arabic, style: theme.titleSmall
                                ?.copyWith(fontSize: 14,
                              color: isen == false ? provider.isDark()
                                  ? AppColors
                                  .black
                                  : AppColors.white : provider.isDark()
                                  ? AppColors.green
                                  : AppColors.darkgreen,)),
                          ),

                        ),
                      )

                    ],
                  )

                ],
              ),
              SizedBox(height: 16,),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    locale.theme,
                    style: theme.titleMedium?.copyWith(fontSize: 18,
                        color: provider.isDark() ? AppColors.green : AppColors
                            .darkgreen),),
                  Row(
                    spacing: 8,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            SharePrefService.settheme("light");
                            provider.changeTheme(ThemeMode.light);

                            issun = true;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: issun ? provider.isDark()
                                  ? AppColors.green
                                  : AppColors.darkgreen : provider.isDark()
                                  ? Colors.black
                                  : AppColors.white,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                  color: issun ? provider.isDark() ? AppColors
                                      .white : AppColors.green : provider
                                      .isDark()
                                      ? Colors.grey
                                      : AppColors.lighgreyev
                              )


                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.wb_sunny_outlined, size: 24, color: issun
                                ? provider.isDark()
                                ? AppColors.black
                                : AppColors
                                .white
                                : provider.isDark()
                                ? AppColors.green
                                : AppColors
                                .darkgreen,),
                          ),
                        ),
                      ),

                      GestureDetector(
                        onTap: () {
                          setState(() {
                            SharePrefService.settheme("dark");
                            provider.changeTheme(ThemeMode.dark);
                            issun = false;
                          });
                        },
                        child: Container(
                            decoration: BoxDecoration(
                                color: issun == false ? provider.isDark()
                                    ? AppColors.green
                                    : AppColors.darkgreen : provider.isDark()
                                    ? Colors.black
                                    : AppColors.white,
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: issun == false ? provider.isDark()
                                        ? AppColors.white
                                        : AppColors.green : provider.isDark()
                                        ? Colors.grey
                                        : AppColors.lighgreyev
                                )


                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Assets.icons.moon.svg(
                                  height: 24, width: 24,
                                  colorFilter: ColorFilter.mode(
                                      issun == false ? provider.isDark()
                                          ? AppColors.black
                                          : AppColors.white : provider.isDark()
                                          ? Colors.white
                                          : AppColors.darkgreen
                                      , BlendMode.srcIn)
                              ),
                            )

                        ),
                      )

                    ],
                  )

                ],
              ),

              SizedBox(height: 16,),

              GestureDetector(
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, AppRouteName.OnBoardingPage, (route) => false);
                  },
                  child: CustomeButton(title: locale.letsStart))


            ],
          ),
        ),

      ),
    );
  }


}