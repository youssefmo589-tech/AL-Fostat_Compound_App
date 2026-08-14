import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../Widgets/CustomeTextField.dart';
import '../../core/AppTheme/AppColors.dart';
import '../../core/provider/SettingProvider.dart';
import '../HomePage/secionContainer.dart';

class AddAchievement extends StatefulWidget {
  const AddAchievement({super.key});

  State<AddAchievement> createState() => _AddAchievementState();
}

class _AddAchievementState extends State<AddAchievement> {
  TextEditingController title = TextEditingController();
  TextEditingController descrption = TextEditingController();

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
        title: Text(
          "Add Achievement",
          style: theme.titleMedium?.copyWith(
            fontSize: 18,
            color: provider.isDark() ? AppColors.green : Colors.black,
          ),
        ),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              SectionContainer(
                image: provider.isDark()
                    ? "assets/images/achievementlightgreen.png"
                    : "assets/images/achievementdarkgreen .png",
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 8,
                children: [
                  Text(
                    "Title",
                    style: theme.titleMedium?.copyWith(
                      fontSize: 16,
                      color: provider.isDark() ? AppColors.green : Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CustomeTextField(hinttxt: "Enter Title", controller: title),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                spacing: 8,
                children: [
                  Text(
                    "Description",
                    style: theme.titleMedium?.copyWith(
                      fontSize: 16,
                      color: provider.isDark() ? AppColors.green : Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  CustomeTextField(
                    hinttxt: "Achievement Description....",
                    controller: descrption,
                    maxlines: 5,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
