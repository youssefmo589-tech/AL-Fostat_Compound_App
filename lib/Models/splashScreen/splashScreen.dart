import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/AppTheme/AppColors.dart';
import '../../core/AppeRoutes/AppRouteName.dart';
import '../../core/gen/assets.gen.dart';
import '../../core/provider/SettingProvider.dart';
import '../Onboarding/SharedprefService.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  void initState() {
    super.initState();
    initializeSplash();
  }

  Future<void> initializeSplash() async
  {
    await checktheme();
    await checkOnBoarding();
  }

  Future<void> checktheme() async
  {
    final theme = await SharePrefService.gettheme();
    final provider = Provider.of<SettingProvider>(context, listen: false);
    if (theme == "light") {
      provider.changeTheme(ThemeMode.light);
    }
    else if (theme == "dark") {
      provider.changeTheme(ThemeMode.dark);
    }
  }

  Future<void> checkOnBoarding() async {
    bool isseen = await SharePrefService.getSeen();
    if (isseen) {
      Future.delayed(Duration(seconds: 4), () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRouteName.letsStart,
          (route) => false,
        );
      });
    } else {
      Future.delayed(Duration(seconds: 4), () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRouteName.letsStart,
          (route) => false,
        ); ////// layouttttttttt
      });
    }
  }

  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final provider = Provider.of<SettingProvider>(context);

    return Scaffold(
        backgroundColor: provider.isDark() ? AppColors.black : AppColors
            .lighgrey,
        body:
        Center(
              child: Padding(
                padding: const EdgeInsets.all(45),
                child: Assets.icons.blackLogo01.svg(
                    colorFilter: ColorFilter.mode(
                        provider.isDark() ? AppColors.green : AppColors
                            .darkgreen, BlendMode.srcIn)),
              ),
            )

    );
  }
}
