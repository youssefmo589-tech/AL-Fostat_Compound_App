import 'package:firebase_auth/firebase_auth.dart';
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
    await checklanguage();
    await checkOnBoarding();
  }

  Future<void> checklanguage() async
  {
    final lan = await SharePrefService.getlanguage();
    final provider = Provider.of<SettingProvider>(context, listen: false);

    if (lan == "en") {
      provider.changedlan(Locale("en"));
    }
    else if (lan == "ar") {
      provider.changedlan(Locale("ar"));
    }
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
    final currentuser = FirebaseAuth.instance.currentUser;
    if (!isseen) {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRouteName.letsStart,
          (route) => false,
        );
      });
    } else if (currentuser != null) {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRouteName.LayoutView,
          (route) => false,
        );
      });

    }
    else {
      Future.delayed(Duration(seconds: 3), () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRouteName.LoginPage,
              (route) => false,
        );
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
