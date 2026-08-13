import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../AppTheme/AppColors.dart';
import '../../AppeRoutes/AppRouteName.dart';
import '../../gen/assets.gen.dart';
import '../../provider/SettingProvider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        AppRouteName.LoginPage,
        (route) => false,
      ); ////// layouttttttttt
    });
  }

  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final provider = Provider.of<SettingProvider>(context);

    return Scaffold(
      backgroundColor: provider.isDark() ? AppColors.black : AppColors.green,
      body: provider.isDark()
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(45),
                child: Assets.images.fostatsplashgreen01.image(),
              ),
            )
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(45),
                child: Assets.images.fostatsplashblack01.image(),
              ),
            ),
    );
  }
}
