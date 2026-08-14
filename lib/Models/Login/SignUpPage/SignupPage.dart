import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Widgets/CustomeButton.dart';
import '../../../Widgets/CustomeDropDownWidget.dart';
import '../../../Widgets/CustomeTextField.dart';
import '../../../core/AppTheme/AppColors.dart';
import '../../../core/AppeRoutes/AppRouteName.dart';
import '../../../core/gen/assets.gen.dart';
import '../../../core/provider/SettingProvider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  String OwnerorTenant = "";

  String BuildingNumber = "";

  String ApartmentNumber = "";

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
    final provider = Provider.of<SettingProvider>(context);
    final theme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.20,
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
                        width: 220,
                        height: 50,
                        child: provider.isDark()
                            ? Assets.images.fostatpagelogogreen.image()
                            : Assets.images.fostatpageLogoBlack.image(),
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
                            "Create your account",
                            style: theme.titleLarge?.copyWith(
                              color: provider.isDark()
                                  ? AppColors.green
                                  : AppColors.black,
                              fontSize: 24,
                            ),
                          ),
                          SizedBox(height: 24),

                          CustomeTextField(
                            hinttxt: "Enter your name",
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
                            hinttxt: "Enter your email",
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
                            hinttxt: "Enter your password",
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
                            hinttxt: "confirm your password",
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

                          SizedBox(height: 16),
                          CustomeTextField(
                            hinttxt: "Enter your Phone Number",
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
                            hinttxt: 'Owner or Tenant',
                            items: ["Owner", "Tenant"],
                            onChanged: onchangedownerortenant,
                          ),
                          SizedBox(height: 16),

                          CustomeDropdownWidget(
                            hinttxt: 'Choose BuildingNumber',
                            items: ['1', '2', '3', '4', '5', '6'],
                            onChanged: onchangedBuildingNumber,
                          ),
                          SizedBox(height: 16),

                          CustomeDropdownWidget(
                            hinttxt: 'Choose ApartmentNumber',
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
                          GestureDetector(
                            onTap: () {
                              if (_formkey.currentState!.validate()) {
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  AppRouteName.LayoutView,
                                  (route) => false,
                                );
                              }
                            },
                            child: CustomeButton(title: "Sign up"),
                          ),
                          SizedBox(height: 40),
                          Center(
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: "Already have an account?",
                                    style: theme.titleSmall?.copyWith(
                                      color: provider.isDark()
                                          ? AppColors.lighgrey
                                          : AppColors.darkgrey,
                                      fontSize: 15,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Login",
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
                              onPressed: () {},
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
      OwnerorTenant = value;
    });
  }

  void onchangedBuildingNumber(String value) {
    setState(() {
      BuildingNumber = value;
    });
  }

  void onchangedApartmentNumber(String value) {
    setState(() {
      ApartmentNumber = value;
    });
  }
}
