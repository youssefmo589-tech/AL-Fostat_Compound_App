import 'package:alfostat/core/AppTheme/AppThemeManager.dart';
import 'package:alfostat/core/provider/SettingProvider.dart';
import 'package:alfostat/firebase_options.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import 'Services/EasyLoadingService.dart';
import 'core/AppeRoutes/AppConfig.dart';
import 'core/AppeRoutes/AppRouteName.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingProvider(),
      child: MyApp(),
    ),
  );

  configLoading();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    final provider = Provider.of<SettingProvider>(context);
    return MaterialApp(
      builder: EasyLoading.init(builder: BotToastInit()),
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouteName.initial,
      onGenerateRoute: AppConfig.onGenerateRoute,
      theme: AppThemeManager.lightheme,
      darkTheme: AppThemeManager.darktheme,
      themeMode: provider.currentTheme,
    );
  }
}
