import 'package:alfostat/core/provider/SettingProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Widgets/CustomeButton.dart';
import '../../../core/AppTheme/AppColors.dart';
import '../../../core/gen/assets.gen.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

class _ForgetPasswordPageState extends State<ForgetPasswordPage> {
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingProvider>(context);
    final theme = Theme.of(context).textTheme;
    return Scaffold(
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
        title: SizedBox(
          width: 200,
          height: 35,
          child: provider.isDark()
              ? Assets.images.fostatpagelogogreen.image()
              : Assets.images.fostatpageLogoBlack.image(),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Column(
          children: [
            Assets.images.changepass.image(
              color: provider.isDark() ? AppColors.green : AppColors.darkgreen,
            ),
            SizedBox(height: 35),
            CustomeButton(title: "Reset password"),
          ],
        ),
      ),
    );
  }
}
