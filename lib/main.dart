import 'package:alfostat/core/AppTheme/AppThemeManager.dart';
import 'package:alfostat/core/provider/SettingProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/AppeRoutes/AppConfig.dart';
import 'core/AppeRoutes/AppRouteName.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => SettingProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Widget build(BuildContext context) {
    final provider = Provider.of<SettingProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRouteName.initial,
      onGenerateRoute: AppConfig.onGenerateRoute,
      theme: AppThemeManager.lightheme,
      darkTheme: AppThemeManager.darktheme,
      themeMode: provider.currentTheme,
    );
  }
}
