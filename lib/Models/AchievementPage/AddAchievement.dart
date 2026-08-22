import 'package:alfostat/Models/AchievementPage/AchieveMentDataModel.dart';
import 'package:alfostat/Services/BotToastservice.dart';
import 'package:alfostat/Widgets/CustomeButton.dart';
import 'package:alfostat/core/FirebaseServices/FirestoreCloudServices/FirestoreCloudService.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../Widgets/CustomeTextField.dart';
import '../../core/AppTheme/AppColors.dart';
import '../../core/Classes/UserModel/UserModel.dart';
import '../../core/FirebaseServices/FirestoreCloudServices/FireCloudServiceToUser.dart';
import '../../core/Strings/Strings.dart';
import '../../core/provider/SettingProvider.dart';
import '../HomePage/secionContainer.dart';

class AddAchievement extends StatefulWidget {
  const AddAchievement({super.key});

  State<AddAchievement> createState() => _AddAchievementState();
}

class _AddAchievementState extends State<AddAchievement> {

  Future<UserModel> loaduser() async
  {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final user = await FireStoreCloudServiceUser.getuser(uid);
    return user;
  }

  UserModel ? user;

  Future<void> Loaduserdata() async
  {
    final data = await loaduser();
    setState(() {
      user = data;
    });
  }

  void initState() {
    super.initState();
    Loaduserdata();
  }


  DateTime ? _selectedDate;
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
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 16,
            children: [
              SectionContainer(
                image: provider.isDark()
                    ? Strings.AcheivementContainerdark
                    : Strings.AcheivementContainerlight,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    spacing: 8,
                    children: [
                      Icon(Icons.calendar_month_outlined, size: 24,
                        color: provider.isDark() ? AppColors.green : AppColors
                            .darkgreen,),
                      Text("Achievement Date",
                        style: theme.titleMedium?.copyWith(fontSize: 16,
                            color: provider.isDark()
                                ? AppColors.lighgrey
                                : Colors.black),),
                    ],
                  ),
                  GestureDetector(
                      onTap: () {
                        _selectdate(context);
                      },
                      child: Text(
                        _selectedDate != null ? DateFormat("yyyy-MM-dd").format(
                            _selectedDate!) : "Choose date",
                        style: theme.titleSmall?.copyWith(
                            color: provider.isDark()
                                ? AppColors.green
                                : AppColors.darkgreen,
                            decoration: TextDecoration.underline,
                            decorationColor: provider.isDark()
                                ? AppColors.green
                                : AppColors.darkgreen),)),
                ],
              ),
              GestureDetector(
                  onTap: () async {
                    if (_selectedDate != null && title.text
                        .trim()
                        .isNotEmpty && descrption.text
                        .trim()
                        .isNotEmpty) {
                      EasyLoading.show();
                      final achievement = AchievementDataModel(
                        author: user!.name,
                          title: title.text.trim(),
                          description: descrption.text.trim(),
                        date: _selectedDate,
                        userid: FirebaseAuth.instance.currentUser!.uid,
                      );
                      bool isadded = await FireStoreCloudService
                          .createAchievement(achievement);
                      if (isadded) {
                        EasyLoading.dismiss();
                        AppSnackBar.success("Achievement Added Successfully");
                        Navigator.pop(context);
                      }
                      else {
                        EasyLoading.dismiss();
                        AppSnackBar.error("Something went wrong");
                      }
                    }
                    else {
                      EasyLoading.dismiss();
                      AppSnackBar.error("Complete all fields");
                    }
                  },
                  child: CustomeButton(title: "Add Achievement")),

            ],
          ),
        ),
      ),
    );
  }

  Future<void> _selectdate(BuildContext context) async
  {
    _selectedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2026),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    setState(() {

    });
  }
  
}
