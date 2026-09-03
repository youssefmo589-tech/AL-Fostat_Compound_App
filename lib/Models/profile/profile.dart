import 'package:alfostat/Models/profile/profileCard.dart';
import 'package:alfostat/core/provider/SettingProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';

import '../../Widgets/BottomSheetContainer.dart';
import '../../core/AppTheme/AppColors.dart';
import '../../core/AppeRoutes/AppRouteName.dart';
import '../../core/Classes/UserModel/UserModel.dart';
import '../../core/FirebaseServices/FirestoreCloudServices/FireCloudServiceToUser.dart';
import '../../core/l10n/app_localizations.dart';
import '../Onboarding/SharedprefService.dart';
import 'SettingOptions.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  int _selectedavatar = -1;


  Future<UserModel> loaduser() async
  {
    final uid = FirebaseAuth.instance.currentUser!.uid;
    final user = await FireStoreCloudServiceUser.getuser(uid);

    return user!;
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
    final locale = AppLocalizations.of(context);

    final theme = Theme.of(context).textTheme;
    final provider = Provider.of<SettingProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 32,
              children: [
                GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        isScrollControlled: true,
                        isDismissible: true,
                        context: context,
                        builder: (BuildContext context) {
                          return StatefulBuilder(builder: (context, setState) {
                            return Padding(
                              padding: const EdgeInsets.all(16),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: provider.isDark()
                                      ? AppColors.black
                                      : AppColors.lighgrey,
                                  borderRadius: BorderRadius.circular(16),

                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceAround,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceAround,
                                      children: [
                                        Expanded(child: GestureDetector(
                                          onTap: () async {
                                            final image = "assets/images/gamer (1).png";
                                            await FireStoreCloudServiceUser
                                                .setImage(user!, image);
                                            this.setState(() {
                                              user!.image = image;
                                            });
                                            setState(() {
                                              _selectedavatar = 1;
                                            });
                                          },
                                          child: BottomsheetContainer(
                                            image: Image.asset(
                                                "assets/images/gamer (1).png"),
                                            index: 1,
                                            isselected: _selectedavatar == 1,),
                                        )),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () async {
                                              final image = "assets/images/gamer (1) (1).png";
                                              await FireStoreCloudServiceUser
                                                  .setImage(user!, image);
                                              this.setState(() {
                                                user!.image = image;
                                              });
                                              setState(() {
                                                _selectedavatar = 2;
                                              });
                                            },

                                            child: BottomsheetContainer(
                                              image: Image.asset(
                                                  "assets/images/gamer (1) (1).png"),
                                              index: 2,
                                              isselected: _selectedavatar ==
                                                  2,),
                                          ),
                                        ),
                                        Expanded(
                                          child: GestureDetector(
                                            onTap: () async {
                                              final image = "assets/images/gamer (1) (2).png";
                                              await FireStoreCloudServiceUser
                                                  .setImage(user!, image);
                                              this.setState(() {
                                                user!.image = image;
                                              });

                                              setState(() {
                                                _selectedavatar = 3;
                                              });
                                            },

                                            child: BottomsheetContainer(
                                              image: Image.asset(
                                                  "assets/images/gamer (1) (2).png"),
                                              index: 3,
                                              isselected: _selectedavatar ==
                                                  3,),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceAround,

                                      children: [
                                        Expanded(child: GestureDetector(
                                          onTap: () async {
                                            final image = "assets/images/gamer (1) (3).png";
                                            await FireStoreCloudServiceUser
                                                .setImage(user!, image);
                                            this.setState(() {
                                              user!.image = image;
                                            });

                                            setState(() {
                                              _selectedavatar = 4;
                                            });
                                          },
                                          child: BottomsheetContainer(
                                            image: Image.asset(
                                                "assets/images/gamer (1) (3).png"),
                                            index: 4,
                                            isselected: _selectedavatar == 4,),
                                        )),
                                        Expanded(child: GestureDetector(
                                          onTap: () async {
                                            final image = "assets/images/gamer (1) (4).png";
                                            await FireStoreCloudServiceUser
                                                .setImage(user!, image);
                                            this.setState(() {
                                              user!.image = image;
                                            });
                                            setState(() {
                                              _selectedavatar = 5;
                                            });
                                          },
                                          child: BottomsheetContainer(
                                            image: Image.asset(
                                                "assets/images/gamer (1) (4).png"),
                                            index: 5,
                                            isselected: _selectedavatar == 5,),
                                        )),
                                        Expanded(child: GestureDetector(
                                          onTap: () async {
                                            final image = "assets/images/gamer (1) (5).png";
                                            await FireStoreCloudServiceUser
                                                .setImage(user!, image);
                                            this.setState(() {
                                              user!.image = image;
                                            });

                                            setState(() {
                                              _selectedavatar = 6;
                                            });
                                          },
                                          child: BottomsheetContainer(
                                            image: Image.asset(
                                                "assets/images/gamer (1) (5).png"),
                                            index: 6,
                                            isselected: _selectedavatar == 6,),
                                        )),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceAround,

                                      children: [
                                        Expanded(child: GestureDetector(
                                          onTap: () async {
                                            final image = "assets/images/gamer (1) (6).png";
                                            await FireStoreCloudServiceUser
                                                .setImage(user!, image);
                                            this.setState(() {
                                              user!.image = image;
                                            });
                                            setState(() {
                                              _selectedavatar = 7;
                                            });
                                          },
                                          child: BottomsheetContainer(
                                            image: Image.asset(
                                                "assets/images/gamer (1) (6).png"),
                                            index: 7,
                                            isselected: _selectedavatar == 7,),
                                        )),
                                        Expanded(child: GestureDetector(
                                          onTap: () async {
                                            final image = "assets/images/gamer (1) (7).png";
                                            await FireStoreCloudServiceUser
                                                .setImage(user!, image);
                                            this.setState(() {
                                              user!.image = image;
                                            });
                                            setState(() {
                                              _selectedavatar = 8;
                                            });
                                          },
                                          child: BottomsheetContainer(
                                            image: Image.asset(
                                                "assets/images/gamer (1) (7).png"),
                                            index: 8,
                                            isselected: _selectedavatar == 8,),
                                        )),
                                        Expanded(child: GestureDetector(
                                          onTap: () async {
                                            final image = "assets/images/gamer (1) (8).png";
                                            await FireStoreCloudServiceUser
                                                .setImage(user!, image);
                                            this.setState(() {
                                              user!.image = image;
                                            });
                                            setState(() {
                                              _selectedavatar = 9;
                                            });
                                          },
                                          child: BottomsheetContainer(
                                            image: Image.asset(
                                                "assets/images/gamer (1) (8).png"),
                                            index: 9,
                                            isselected: _selectedavatar == 9,),
                                        )),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }
                          );
                        }
                    );
                  },
                  child: user?.image == null ? CircleAvatar(
                    radius: 60,
                    backgroundColor: provider.isDark()
                        ? AppColors.lighgrey
                        : AppColors.darkgrey,
                    child: Icon(Icons.person, size: 85,
                        color: provider.isDark()
                            ? AppColors.darkgrey
                            : AppColors.lighgrey),
                  ) : CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(user!.image!),
                  ),
                ),


                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  spacing: 8,
                  children: [

                    ProfileCard(title: "${locale!.nameLabel} :  ${ user?.name ??
                        "Name..."}",),
                    ProfileCard(
                      title: "${locale.emailLabel} :  ${ user?.email ??
                          "Email..."}",),
                    ProfileCard(
                      title: "${locale.phoneNumberLabel} :  ${user?.phone ??
                          "phone..."}",),
                    ProfileCard(
                      title: "${locale.buildingNumberLabel} :  ${user
                          ?.buildingNumber ?? "..."}",),
                    ProfileCard(
                      title: "${locale.apartmentNumberLabel} :  ${user
                          ?.apartmentNumber ??
                          "..."}",),

                  ],
                ),

                Column(
                  spacing: 16,
                  children: [
                    SettingOptions(
                      Optionname: locale!.darkMode,
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
                            SharePrefService.settheme("dark");

                            provider.changeTheme(ThemeMode.dark);
                          } else {
                            SharePrefService.settheme("light");

                            provider.changeTheme(ThemeMode.light);
                          }
                        },
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, AppRouteName.ChangeLanguage);
                      },
                      child: SettingOptions(
                        Optionname: locale.language,
                        optionicon: Icon(
                          Icons.arrow_forward_ios_outlined,
                          color: provider.isDark()
                              ? AppColors.green
                              : AppColors.darkgreen,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        await FirebaseAuth.instance.signOut();
                        Navigator.pushNamedAndRemoveUntil(
                            context, AppRouteName.LoginPage, (route) => false);
                      },
                      child: SettingOptions(
                        Optionname: locale.logout,
                        optionicon: Icon(Icons.logout, color: Colors.red),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
