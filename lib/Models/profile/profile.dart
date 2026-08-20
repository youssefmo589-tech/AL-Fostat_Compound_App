import 'package:alfostat/core/provider/SettingProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

import '../../core/AppTheme/AppColors.dart';
import '../../core/AppeRoutes/AppRouteName.dart';
import '../../core/Classes/UserModel/UserModel.dart';
import '../../core/FirebaseServices/FirestoreCloudServices/FireCloudServiceToUser.dart';
import 'SettingOptions.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

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

  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    final provider = Provider.of<SettingProvider>(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 32,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 4,
              children: [
                Text(
                  user?.name ?? "Name...",
                  style: theme.titleLarge?.copyWith(
                    fontSize: 20,
                    color: provider.isDark()
                        ? AppColors.white
                        : AppColors.black,
                  ),
                ),
                Text(
                  user?.email ?? "Email...",
                  style: theme.titleSmall?.copyWith(
                    color: provider.isDark()
                        ? AppColors.lighgrey
                        : AppColors.darkgrey,
                  ),
                ),
                Text(
                  "PhoneNumber : ${user?.phone ?? "phone..."}",
                  style: theme.titleSmall?.copyWith(
                    color: provider.isDark()
                        ? AppColors.lighgrey
                        : AppColors.darkgrey,
                  ),
                ),
                Text(
                  "BuildinNumber : ${user?.buildingNumber ?? "..."}",
                  style: theme.titleSmall?.copyWith(
                    color: provider.isDark()
                        ? AppColors.lighgrey
                        : AppColors.darkgrey,
                  ),
                ),
                Text(
                  "apartmentNumber : ${user?.apartmentNumber ?? "..."}",
                  style: theme.titleSmall?.copyWith(
                    color: provider.isDark()
                        ? AppColors.lighgrey
                        : AppColors.darkgrey,
                  ),
                ),

              ],
            ),

            Column(
              spacing: 16,
              children: [
                SettingOptions(
                  Optionname: "Dark Mode",
                  optionicon: FlutterSwitch(
                    width: 60.0,
                    toggleSize: 28.0,
                    value: provider.isDark(),
                    borderRadius: 30.0,
                    padding: 2.0,
                    activeColor: AppColors.darkgreen,
                    inactiveColor: AppColors.darkgrey,
                    activeToggleColor: AppColors.white,
                    inactiveToggleColor: AppColors.white,
                    onToggle: (bool value) {
                      if (value) {
                        provider.changeTheme(ThemeMode.dark);
                      } else {
                        provider.changeTheme(ThemeMode.light);
                      }
                    },
                  ),
                ),
                SettingOptions(
                  Optionname: "Language",
                  optionicon: Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: provider.isDark()
                        ? AppColors.green
                        : AppColors.darkgreen,
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.pushNamedAndRemoveUntil(
                        context, AppRouteName.LoginPage, (route) => false);
                  },
                  child: SettingOptions(
                    Optionname: "Logout",
                    optionicon: Icon(Icons.logout, color: Colors.red),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
