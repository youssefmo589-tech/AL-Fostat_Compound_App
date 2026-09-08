import 'package:alfostat/Services/BotToastservice.dart';
import 'package:alfostat/Widgets/CustomeButton.dart';
import 'package:alfostat/core/AppeRoutes/AppRouteName.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:provider/provider.dart';

import '../../../core/AppTheme/AppColors.dart';
import '../../../core/Classes/UserModel/UserModel.dart';
import '../../../core/FirebaseServices/FirestoreCloudServices/FireCloudServiceToUser.dart';
import '../../../core/gen/assets.gen.dart';
import '../../../core/provider/SettingProvider.dart';

class VerifyMyEmail extends StatefulWidget {
  const VerifyMyEmail({super.key});

  State<VerifyMyEmail> createState() => _VerifymyemailState();
}

class _VerifymyemailState extends State<VerifyMyEmail>
    with WidgetsBindingObserver {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      checkEmailVerification();
    }
  }

  Future<void> checkEmailVerification() async {
    final currentuser = FirebaseAuth.instance.currentUser;
    await currentuser?.reload();
    if (FirebaseAuth.instance.currentUser?.emailVerified == true) {
      final user = ModalRoute.of(context)?.settings.arguments as UserModel;
      final success = await FireStoreCloudServiceUser.createuser(user);
      if (success) {
        AppSnackBar.success("Email Verified Successfully");
        Navigator.pushNamedAndRemoveUntil(
          context,
          AppRouteName.LayoutView,
          (route) => false,
        );
      }
    }
    // else
    //   {
    //     await FirebaseAuth.instance.currentUser?.delete() ;
    //   }
  }

  final _formkey = GlobalKey<FormState>();

  bool ishidden = false;

  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)?.settings.arguments as UserModel;
    final provider = Provider.of<SettingProvider>(context);
    final theme = Theme.of(context).textTheme;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                provider.isDark()
                    ? Assets.images.verificationLight.image()
                    : Assets.images.verificationDark.image(),

                Text(
                  "Verify Your Email",
                  style: theme.titleLarge?.copyWith(
                    color: provider.isDark()
                        ? AppColors.green
                        : AppColors.black,
                    fontSize: 24,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  "Tap the button, go to your email inbox or spam folder, tap the verification link, and then return to the app.",
                  style: theme.titleSmall?.copyWith(
                    fontSize: 18,
                    color: provider.isDark()
                        ? AppColors.white
                        : AppColors.black,
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Bounceable(
                    onTap: () async {
                      await checkEmailVerification();

                      AppSnackBar.warning("Check Your Email Messages");
                    },
                    child: CustomeButton(title: "Verify My Email"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
