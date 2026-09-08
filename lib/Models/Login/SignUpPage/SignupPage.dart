import 'package:alfostat/Models/Login/ForgetPasswordPage/VerifyMyEmail.dart';
import 'package:alfostat/Services/BotToastservice.dart';
import 'package:alfostat/core/Classes/UserModel/UserModel.dart';
import 'package:alfostat/core/FirebaseServices/FirebaseAuth/FirebaseAuth.dart';
import 'package:alfostat/core/FirebaseServices/FirestoreCloudServices/FireCloudServiceToUser.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import '../../../Widgets/CustomeButton.dart';
import '../../../Widgets/CustomeDropDownWidget.dart';
import '../../../Widgets/CustomeTextField.dart';
import '../../../core/AppTheme/AppColors.dart';
import '../../../core/AppeRoutes/AppRouteName.dart';
import '../../../core/gen/assets.gen.dart';
import '../../../core/l10n/app_localizations.dart';
import '../../../core/provider/SettingProvider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {


  String ? _OwnerorTenant;

  String ? _buildingNumber;

  String ? _apartmentNumber;

  final _formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController confirmpasswordcontroller = TextEditingController();

  TextEditingController name = TextEditingController();

  TextEditingController confirmpassword = TextEditingController();

  TextEditingController phone = TextEditingController();

  bool ishidden = false;

  bool ishiddenconfirm = false;

  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);

    final isgoogleaccount =
        ModalRoute
            .of(context)
            ?.settings
            .arguments as bool? ?? false;
    final provider = Provider.of<SettingProvider>(context);
    final theme = Theme.of(context).textTheme;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height * 0.20,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          AppColors.green,
                          provider.isDark()
                              ? AppColors.black
                              : AppColors.lighgrey,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                    child: Center(
                      child: SizedBox(
                        width: 240,
                        height: 60,
                        child: SizedBox(
                            child: Assets.icons.logotextlarge01.svg(
                              colorFilter: provider.isDark()
                                  ? ColorFilter.mode(
                                  AppColors.lighgrey, BlendMode.srcIn)
                                  : ColorFilter.mode(
                                  AppColors.darkgreen, BlendMode.srcIn),)),
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Form(
                    key: _formkey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Text(
                            locale!.createYourAccount,
                            style: theme.titleLarge?.copyWith(
                              color: provider.isDark()
                                  ? AppColors.green
                                  : AppColors.black,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(height: 24),

                          isgoogleaccount == false ? Column(
                            children: [
                              CustomeTextField(
                                hinttxt: locale.enterYourName,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "please , enter your name";
                                  }

                                  return null;
                                },
                                controller: name,
                                prefixIcon: Icon(
                                  Icons.person_outline,
                                  size: 24,
                                  color: AppColors.lighgreyev,
                                ),
                              ),
                              SizedBox(height: 16),
                              CustomeTextField(
                                hinttxt: locale.enterYourEmail,
                                validator: (value) {
                                  RegExp reg = RegExp(
                                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                                  );
                                  if (value == null || value.isEmpty) {
                                    return "please , enter your email";
                                  }
                                  if (!reg.hasMatch(value)) {
                                    return "please , enter a valid email";
                                  }
                                  return null;
                                },
                                controller: email,
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  size: 24,
                                  color: AppColors.lighgreyev,
                                ),
                              ),
                              SizedBox(height: 16),

                              CustomeTextField(
                                hinttxt: locale.enterYourPassword,
                                obscureText: ishidden,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "please enter your password";
                                  }
                                  RegExp reg = RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                                  );
                                  if (!reg.hasMatch(value)) {
                                    return "please enter correct password";
                                  }
                                  return null;
                                },
                                controller: password,
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  size: 24,
                                  color: AppColors.lighgreyev,
                                ),
                                suffixIcon: ishidden
                                    ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      ishidden = !ishidden;
                                    });
                                  },
                                  child: Icon(
                                    Icons.visibility_off_outlined,
                                    size: 24,
                                    color: AppColors.lighgreyev,
                                  ),
                                )
                                    : GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      ishidden = !ishidden;
                                    });
                                  },
                                  child: Icon(
                                    Icons.visibility_outlined,
                                    size: 24,
                                    color: AppColors.lighgreyev,
                                  ),
                                ),
                              ),

                              SizedBox(height: 16),

                              CustomeTextField(
                                hinttxt: locale.confirmYourPassword,
                                obscureText: ishiddenconfirm,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "please enter your password";
                                  }
                                  if (value != password.text) {
                                    return "please enter correct password";
                                  }

                                  return null;
                                },
                                controller: confirmpasswordcontroller,
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  size: 24,
                                  color: AppColors.lighgreyev,
                                ),
                                suffixIcon: ishiddenconfirm
                                    ? GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      ishiddenconfirm = !ishiddenconfirm;
                                    });
                                  },
                                  child: Icon(
                                    Icons.visibility_off_outlined,
                                    size: 24,
                                    color: AppColors.lighgreyev,
                                  ),
                                )
                                    : GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      ishiddenconfirm = !ishiddenconfirm;
                                    });
                                  },
                                  child: Icon(
                                    Icons.visibility_outlined,
                                    size: 24,
                                    color: AppColors.lighgreyev,
                                  ),
                                ),
                              ),
                            ],
                          ) : SizedBox(),


                          isgoogleaccount ? SizedBox() : SizedBox(height: 16),
                          CustomeTextField(
                            hinttxt: locale.enterYourPhoneNumber,
                            validator: (value) {
                              RegExp reg = RegExp(
                                r'^[+]*[(]{0,1}[0-9]{1,4}[)]{0,1}[-\s\./0-9]*$',
                              );
                              if (value == null || value.isEmpty) {
                                return "please , enter your Phone Number";
                              }
                              if (!reg.hasMatch(value)) {
                                return "please , enter a valid Number";
                              }
                              if (value.length > 11 || value.length < 11) {
                                return "please , enter a valid Number";
                              }
                              return null;
                            },
                            controller: phone,
                            prefixIcon: Icon(
                              Icons.phone,
                              size: 24,
                              color: AppColors.lighgreyev,
                            ),
                          ),
                          SizedBox(height: 16),

                          CustomeDropdownWidget(
                            hinttxt: locale.ownerOrTenant,
                            items: [locale.owner, locale.tenant],
                            onChanged: onchangedownerortenant,
                          ),
                          SizedBox(height: 16),

                          CustomeDropdownWidget(
                            hinttxt: locale.chooseBuildingNumber,
                            items: ['1', '2', '3', '4', '5', '6'],
                            onChanged: onchangedBuildingNumber,
                          ),
                          SizedBox(height: 16),

                          CustomeDropdownWidget(
                            hinttxt: locale.chooseApartmentNumber,
                            items: [
                              '1',
                              '2',
                              '3',
                              '4',
                              '5',
                              '6',
                              '7',
                              '8',
                              '9',
                              '10',
                              '11',
                              '12',
                              '13',
                              '14',
                              '15',
                              '16',
                            ],
                            onChanged: onchangedApartmentNumber,
                          ),

                          SizedBox(height: 40),
                          isgoogleaccount == false ? GestureDetector(
                            onTap: () async {
                              if (_formkey.currentState!.validate()) {
                                if (_OwnerorTenant != null &&
                                    _buildingNumber != null &&
                                    _apartmentNumber != null) {
                                  final isapartmentexist = await FireStoreCloudServiceUser
                                      .isapartmentexist(
                                      _buildingNumber!, _apartmentNumber!);

                                  if (isapartmentexist) {
                                    AppSnackBar.error(
                                        "this apartment is already exist");
                                    return;
                                  }

                                  final token = await FirebaseMessaging.instance
                                      .getToken();

                                  EasyLoading.show();
                                  bool isaccountcreated = await AuthService
                                      .createAccount(email.text, password.text);
                                  if (isaccountcreated) {
                                    UserModel user = UserModel(
                                      name: name.text,
                                      email: email.text,
                                      phone: phone.text,
                                      buildingNumber: _buildingNumber,
                                      apartmentNumber: _apartmentNumber,
                                      isTenant: _OwnerorTenant == "Tenant"
                                          ? true
                                          : false,
                                      isOwner: _OwnerorTenant == "Owner"
                                          ? true
                                          : false,
                                      isPay: false,
                                      userid: FirebaseAuth.instance
                                          .currentUser!.uid,

                                      fcmtoken: token,
                                    );

                                    EasyLoading.dismiss();
                                    Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) =>
                                            VerifyMyEmail(),
                                            settings: RouteSettings(
                                                arguments: user)));


                                    // bool isusercreated = await FireStoreCloudServiceUser
                                    //     .createuser(user);
                                    // if (isusercreated) {
                                    //   EasyLoading.dismiss();
                                    //   AppSnackBar.success(
                                    //       "create user is success");
                                    //   Navigator.pushNamedAndRemoveUntil(
                                    //     context,
                                    //     AppRouteName.LayoutView,
                                    //         (route) => false,
                                    //   );
                                    // }
                                    // else {
                                    //   EasyLoading.dismiss();
                                    //   AppSnackBar.error(
                                    //       "create user is failed");
                                    // }
                                  }
                                  else {
                                    EasyLoading.dismiss();
                                    AppSnackBar.error(
                                        "create account is failed , may be this email is exist");
                                  }
                                }
                                else {
                                  EasyLoading.dismiss();
                                  AppSnackBar.error(
                                      "Please Complete All Fields");
                                }
                              }
                            },
                            child: CustomeButton(title: locale.signup),
                          ) : SizedBox(),
                          isgoogleaccount ? SizedBox() : SizedBox(height: 40),
                          Center(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: locale.alreadyHaveAccount,
                                    style: theme.titleSmall?.copyWith(
                                      color: provider.isDark()
                                          ? AppColors.lighgrey
                                          : AppColors.darkgrey,
                                      fontSize: 15,
                                    ),
                                  ),
                                  TextSpan(
                                    text: locale.login,
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {
                                        Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          AppRouteName.LoginPage,
                                              (route) => false,
                                        );
                                      },
                                    style: theme.titleSmall?.copyWith(
                                      decorationColor: provider.isDark()
                                          ? AppColors.green
                                          : AppColors.darkgreen,
                                      decoration: TextDecoration.underline,
                                      color: provider.isDark()
                                          ? AppColors.green
                                          : AppColors.darkgreen,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Center(
                            child: Text(
                              "Or",
                              style: theme.titleMedium?.copyWith(
                                color: provider.isDark()
                                    ? AppColors.green
                                    : AppColors.darkgreen,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          SizedBox(height: 20),

                          SizedBox(
                            width: double.infinity,
                            height: 48,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: provider.isDark()
                                    ? AppColors.black
                                    : AppColors.white,
                                side: BorderSide(
                                  color: provider.isDark()
                                      ? AppColors.green
                                      : Colors.transparent,
                                  width: 1.5,
                                ),
                              ),
                              onPressed: () async {
                                try {
                                  if (_OwnerorTenant != null &&
                                      _buildingNumber != null &&
                                      _apartmentNumber != null &&
                                      phone.text.isNotEmpty) {
                                    final isapartmentexist = await FireStoreCloudServiceUser
                                        .isapartmentexist(
                                        _buildingNumber!, _apartmentNumber!);

                                    if (isapartmentexist) {
                                      AppSnackBar.error(
                                          "this apartment is already exist");
                                      return;
                                    }
                                    final token = await FirebaseMessaging
                                        .instance.getToken();

                                    await AuthService.signInWithGoogle();
                                    final uid = FirebaseAuth.instance
                                        .currentUser!.uid;
                                    EasyLoading.show();
                                    UserModel user = UserModel(
                                        name: FirebaseAuth.instance.currentUser!
                                            .displayName,
                                        email: FirebaseAuth.instance
                                            .currentUser!.email,
                                        phone: phone.text,
                                        fcmtoken: token,
                                        buildingNumber: _buildingNumber,
                                        apartmentNumber: _apartmentNumber,
                                        isTenant: _OwnerorTenant == "Tenant"
                                            ? true
                                            : false,
                                        isOwner: _OwnerorTenant == "Owner"
                                            ? true
                                            : false,
                                        isPay: false,
                                        userid: uid

                                    );

                                    final success = await FireStoreCloudServiceUser
                                        .createuser(user);

                                    EasyLoading.dismiss();

                                    if (success) {
                                      AppSnackBar.success(
                                          "Create Account is Success");
                                      Navigator.pushNamedAndRemoveUntil(
                                          context, AppRouteName.LayoutView, (
                                          route) => false);
                                    } else {
                                      AppSnackBar.error(
                                          "Failed to create account");
                                    }
                                  }
                                  else {
                                    EasyLoading.dismiss();
                                    AppSnackBar.error(
                                        "Please Complete All Fields");
                                  }
                                } catch (error) {
                                  EasyLoading.dismiss();
                                  AppSnackBar.error(
                                      "Please Complete All Fields");
                                }
                              },
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 9,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 24,
                                      height: 24,
                                      child: Assets.images.google.image(),
                                    ),

                                    SizedBox(width: 16),

                                    Text(
                                      "Sign up with Google",
                                      style: theme.titleMedium?.copyWith(
                                        fontSize: 18,
                                        color: provider.isDark()
                                            ? AppColors.green
                                            : AppColors.darkgreen,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }

  void onchangedownerortenant(String value) {
    setState(() {
      _OwnerorTenant = value;
    });
  }

  void onchangedBuildingNumber(String value) {
    setState(() {
      _buildingNumber = value;
    });
  }

  void onchangedApartmentNumber(String value) {
    setState(() {
      _apartmentNumber = value;
    });
  }

}
