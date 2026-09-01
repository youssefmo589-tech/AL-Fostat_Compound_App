import 'package:alfostat/Widgets/CustomeButton.dart';
import 'package:alfostat/core/provider/SettingProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/AppTheme/AppColors.dart';
import '../../core/AppeRoutes/AppRouteName.dart';
import '../../core/gen/assets.gen.dart';

class letsStart extends StatefulWidget {
  const letsStart({super.key});

  State<letsStart> createState() => _letsStartState();
}

class _letsStartState extends State<letsStart> {
  bool issun = true;

  bool isen = true;


  Widget build(BuildContext context) {
    final provider = Provider.of<SettingProvider>(context);

    final theme = Theme
        .of(context)
        .textTheme;

    return Scaffold(

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24,),
            Assets.images.letsStart.image(),
            SizedBox(height: 24,),
            Text("Welcome to Your Community", style: theme.titleLarge?.copyWith(
                fontSize: 20,
                color: provider.isDark() ? AppColors.white : Colors.black),),
            SizedBox(height: 8,),
            Text(
              "Set up your preferences and get started with a smarter way to stay connected with your community.",
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
                Text("Language", style: theme.titleMedium?.copyWith(
                    fontSize: 18,
                    color: provider.isDark() ? AppColors.green : AppColors
                        .darkgreen),),
                Row(
                  spacing: 8,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
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
                                    .white : AppColors.green : provider.isDark()
                                    ? Colors.grey
                                    : AppColors.lighgreyev
                            )


                        ),
                        // child: Icon(Icons.wb_sunny_outlined , size: 24 , color:  issun ?provider.isDark() ?  AppColors.green : AppColors.darkgreen : provider.isDark()? Colors.white : AppColors.darkgreen ,),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("English", style: theme.titleSmall
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
                          isen = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: isen == false ? provider.isDark() ? AppColors
                                .green : AppColors.darkgreen : provider.isDark()
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
                        // child: Icon(Icons.wb_sunny_outlined , size: 24 , color:  issun ?provider.isDark() ?  AppColors.green : AppColors.darkgreen : provider.isDark()? Colors.white : AppColors.darkgreen ,),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Arabic", style: theme.titleSmall
                              ?.copyWith(fontSize: 14,
                            color: isen == false ? provider.isDark() ? AppColors
                                .black : AppColors.white : provider.isDark()
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
                Text("Theme", style: theme.titleMedium?.copyWith(fontSize: 18,
                    color: provider.isDark() ? AppColors.green : AppColors
                        .darkgreen),),
                Row(
                  spacing: 8,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
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
                                    .white : AppColors.green : provider.isDark()
                                    ? Colors.grey
                                    : AppColors.lighgreyev
                            )


                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.wb_sunny_outlined, size: 24, color: issun
                              ? provider.isDark() ? AppColors.black : AppColors
                              .white
                              : provider.isDark() ? AppColors.green : AppColors
                              .darkgreen,),
                        ),
                      ),
                    ),

                    GestureDetector(
                      onTap: () {
                        setState(() {
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
                          // child: Icon(Icons.wb_sunny_outlined , size: 24 , color:  issun ?provider.isDark() ?  AppColors.green : AppColors.darkgreen : provider.isDark()? Colors.white : AppColors.darkgreen ,),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Assets.icons.moon.svg(height: 24, width: 24,
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
                child: CustomeButton(title: "Lets Start"))


          ],
        ),
      ),

    );
  }


}