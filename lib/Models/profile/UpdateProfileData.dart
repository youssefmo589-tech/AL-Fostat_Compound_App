import 'package:alfostat/Services/BotToastservice.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import '../../Widgets/CustomeButton.dart';
import '../../Widgets/CustomeTextField.dart';
import '../../core/AppTheme/AppColors.dart';
import '../../core/AppeRoutes/AppRouteName.dart';
import '../../core/Classes/UserModel/UserModel.dart';
import '../../core/FirebaseServices/FirestoreCloudServices/FireCloudServiceToUser.dart';
import '../../core/provider/SettingProvider.dart';

class UpdateProfileData extends StatefulWidget {
  const UpdateProfileData({super.key});

  State<UpdateProfileData> createState() => _UpdateProfileDataState();
}

class _UpdateProfileDataState extends State<UpdateProfileData> {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController phonecontroller = TextEditingController();

  Future<UserModel> loaduser() async {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final user = await FireStoreCloudServiceUser.getuser(uid);

    return user!;
  }

  UserModel? user;

  Future<void> Loaduserdata() async {
    final data = await loaduser();
    setState(() {
      user = data;
      namecontroller.text = user?.name ?? "";
      phonecontroller.text = user?.phone ?? "";
    });
  }

  void initState() {
    super.initState();
    Loaduserdata();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SettingProvider>(context);
    final theme = Theme.of(context).textTheme;
    final _formkey = GlobalKey<FormState>();
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
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "Change Name",
                  style: theme.titleLarge?.copyWith(
                    color: provider.isDark()
                        ? AppColors.green
                        : AppColors.black,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 10),

                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      CustomeTextField(
                        hinttxt: namecontroller.text,
                        controller: namecontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "There is no new data.";
                          }
                        },
                      ),

                      SizedBox(height: 16),

                      Text(
                        "Change Phone",
                        style: theme.titleLarge?.copyWith(
                          color: provider.isDark()
                              ? AppColors.green
                              : AppColors.black,
                          fontSize: 24,
                        ),
                      ),
                      SizedBox(height: 10),
                      CustomeTextField(
                        hinttxt: phonecontroller.text,
                        controller: phonecontroller,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "There is no new data.";
                          }
                          if (value.length > 11 || value.length < 11) {
                            return "Invalid Phone Number";
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),

                Bounceable(
                  onTap: () async {
                    EasyLoading.show();

                    if (_formkey.currentState!.validate()) {
                      try {
                        bool isupdated = false;
                        if (namecontroller.text != user!.name) {
                          await FireStoreCloudServiceUser.UpdateName(
                            user!,
                            namecontroller.text,
                          );
                          isupdated = true;
                        }
                        if (phonecontroller.text != user!.phone) {
                          await FireStoreCloudServiceUser.UpdatePhone(
                            user!,
                            phonecontroller.text,
                          );

                          isupdated = true;
                        }
                        if (isupdated) {
                          EasyLoading.dismiss();
                          AppSnackBar.success("Data Updated Successfully");
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRouteName.LayoutView,
                            (route) => false,
                          );
                        } else {
                          EasyLoading.dismiss();
                          AppSnackBar.error("There is no new data");
                        }
                      } catch (error) {
                        EasyLoading.dismiss();
                        AppSnackBar.error("Something went wrong");
                      }
                    } else {
                      EasyLoading.dismiss();
                    }
                  },

                  child: CustomeButton(title: "Save Changes"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
