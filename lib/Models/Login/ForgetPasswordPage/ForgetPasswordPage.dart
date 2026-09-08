import 'package:alfostat/Services/BotToastservice.dart';
import 'package:alfostat/core/provider/SettingProvider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../Widgets/CustomeButton.dart';
import '../../../Widgets/CustomeTextField.dart';
import '../../../core/AppTheme/AppColors.dart';
import '../../../core/gen/assets.gen.dart';
import '../../../core/l10n/app_localizations.dart';

class ForgetPasswordPage extends StatefulWidget {
  const ForgetPasswordPage({Key? key}) : super(key: key);

  State<ForgetPasswordPage> createState() => _ForgetPasswordPageState();
}

final _formkey = GlobalKey<FormState>();
class _ForgetPasswordPageState extends State<ForgetPasswordPage> {

  TextEditingController controller = TextEditingController();
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context);

    final provider = Provider.of<SettingProvider>(context);
    final theme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 30,
              color: provider.isDark() ? AppColors.green : AppColors.darkgreen,
            ),
          ),
          title: Text(locale!.forgetPassword, style: TextStyle(
              color: provider.isDark() ? AppColors.green : AppColors
                  .darkgreen),),
          centerTitle: true,


        ),


        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Assets.images.changepass.image(
                  color: provider.isDark() ? AppColors.green : AppColors
                      .darkgreen,
                ),
                SizedBox(height: 35),

                Form(
                  key: _formkey,
                  child: CustomeTextField(hinttxt: "enter your email",
                    controller: controller,
                    prefixIcon: Icon(Icons.email_outlined, size: 24,
                        color: provider.isDark() ? AppColors.green : AppColors
                            .darkgreen),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "please , enter your email";
                      }
                      RegExp reg = RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      );
                      if (!reg.hasMatch(value)) {
                        return "please , enter a valid email";
                      }
                    },
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                    onTap: () async {
                      if (_formkey.currentState!.validate()) {
                        try {
                          await FirebaseAuth.instance.sendPasswordResetEmail(
                              email: controller.text.trim());
                          AppSnackBar.success(
                              "Check your email including spam folder");
                        } on FirebaseAuthException catch (error) {
                          AppSnackBar.error(error.message.toString());
                        }
                      }
                    },
                    child: CustomeButton(title: locale!.resetPassword)

                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
