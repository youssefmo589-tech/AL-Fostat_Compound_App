import 'package:alfostat/Models/Login/SignUpPage/SignupPage.dart';
import 'package:alfostat/core/AppeRoutes/AppRouteName.dart';
import 'package:alfostat/core/provider/SettingProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

import '../../../Services/BotToastservice.dart';
import '../../../Widgets/CustomeButton.dart';
import '../../../Widgets/CustomeTextField.dart';
import '../../../core/AppTheme/AppColors.dart';
import '../../../core/FirebaseServices/FirebaseAuth/FirebaseAuth.dart';
import '../../../core/FirebaseServices/FirestoreCloudServices/FireCloudServiceToUser.dart';
import '../../../core/gen/assets.gen.dart';
import '../../../core/l10n/app_localizations.dart';

class LoginPage extends StatefulWidget {

  const LoginPage({super.key});

  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _formkey = GlobalKey<FormState>();
  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  bool ishidden = false;

  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);
    final provider = Provider.of<SettingProvider>(context);
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.25,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.green,
                    provider.isDark() ? AppColors.black : AppColors.lighgrey,
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
                        colorFilter: provider.isDark() ? ColorFilter.mode(
                            AppColors.lighgrey, BlendMode.srcIn) : ColorFilter
                            .mode(AppColors.darkgreen, BlendMode.srcIn),)),
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
                      locale!.loginToYourAccount,
                      style: theme.titleLarge?.copyWith(
                        color: provider.isDark()
                            ? AppColors.green
                            : AppColors.black,
                        fontSize: 24,
                      ),
                    ),
                    SizedBox(height: 24),
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
                    SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            AppRouteName.ForgetPasswordPage,
                          );
                        },
                        child: Text(
                          locale.forgetPassword,
                          style: theme.titleLarge?.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: provider.isDark()
                                ? AppColors.green
                                : AppColors.darkgreen,
                            fontSize: 15,
                            color: provider.isDark()
                                ? AppColors.green
                                : AppColors.darkgreen,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 40),
                    GestureDetector(
                      onTap: () async {
                        if (_formkey.currentState!.validate()) {
                          EasyLoading.show();

                          final result = await AuthService.signInwithAccount(
                              email.text, password.text);
                          if (result) {
                            final uid = FirebaseAuth.instance.currentUser!.uid;
                            final token = await FirebaseMessaging.instance
                                .getToken();
                            final updatetoken = await FireStoreCloudServiceUser
                                .updatefcmtoken(uid, token!);
                            if (updatetoken == false) {
                              EasyLoading.dismiss();
                              AppSnackBar.error("something went wrong");
                              return;
                            }
                            EasyLoading.dismiss();
                            Navigator.pushNamedAndRemoveUntil(
                              context,
                              AppRouteName.LayoutView,
                                  (route) => false,
                            );
                          }
                          else {
                            EasyLoading.dismiss();
                            AppSnackBar.error(
                                "Not Exist ,try again with a correct password & email Or signup");
                          }

                        }
                      },
                      child: CustomeButton(title: locale.login),
                    ),
                    SizedBox(height: 40),
                    Center(
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: locale.dontHaveAccount,
                              style: theme.titleSmall?.copyWith(
                                color: provider.isDark()
                                    ? AppColors.lighgrey
                                    : AppColors.darkgrey,
                                fontSize: 15,
                              ),
                            ),
                            TextSpan(
                              text: locale.signup,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(
                                    context,
                                    AppRouteName.SignupPage,

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
                          EasyLoading.show();

                          final user = await AuthService.signInWithGoogle();
                          if (user == null) {
                            EasyLoading.dismiss();
                            AppSnackBar.warning("Google signin canceled");
                            return;
                          }
                          else {
                            try {
                              final uid = user.user!.uid;
                              final usermodel = await FireStoreCloudServiceUser
                                  .getuser(uid);

                              if (usermodel != null) {
                                final token = await FirebaseMessaging.instance
                                    .getToken();
                                final updatetoken = await FireStoreCloudServiceUser
                                    .updatefcmtoken(uid, token!);
                                EasyLoading.dismiss();
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  AppRouteName.LayoutView,
                                      (route) => false,
                                );
                              }
                              else {
                                await user.user!.delete();
                                await FirebaseAuth.instance.signOut();

                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        settings: RouteSettings(
                                            arguments: true),
                                        builder: (context) => SignupPage()), (
                                    route) => false);

                                EasyLoading.dismiss();
                                AppSnackBar.warning(
                                    "Account Not Exist , please signup");
                              }
                            } catch (error) {
                              AppSnackBar.error("something went wrong");
                            }
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 9),
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
                                locale.loginWithGoogle,
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
    );
  }
}
