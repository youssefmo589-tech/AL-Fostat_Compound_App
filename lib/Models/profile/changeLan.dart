import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:provider/provider.dart';

import '../../core/AppTheme/AppColors.dart';
import '../../core/l10n/app_localizations.dart';
import '../../core/provider/SettingProvider.dart';
import '../Onboarding/SharedprefService.dart';

class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({super.key});

  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final provider = Provider.of<SettingProvider>(context);
    final theme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios_new,
              size: 30,
              color: provider.isDark() ? AppColors.green : AppColors.darkgreen,
            ),
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                Bounceable(
                  onTap: () {
                    provider.changedlan(Locale("en"));
                    SharePrefService.setlanguage("en");
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: provider.isDark()
                            ? AppColors.green
                            : AppColors.darkgreen,
                        width: 1.5,
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          locale!.english,
                          style: theme.titleMedium?.copyWith(
                            color: provider.isDark()
                                ? AppColors.green
                                : AppColors.darkgreen,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Bounceable(
                  onTap: () {
                    provider.changedlan(Locale("ar"));
                    SharePrefService.setlanguage("ar");
                  },
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: provider.isDark()
                            ? AppColors.green
                            : AppColors.darkgreen,
                        width: 1.5,
                      ),
                    ),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          locale.arabic,
                          style: theme.titleMedium?.copyWith(
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
          ),
        ),
      ),
    );
  }
}
