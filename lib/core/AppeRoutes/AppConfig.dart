import 'package:alfostat/Models/ComplaintPage/AddComplaint.dart';
import 'package:flutter/material.dart';

import '../../Models/AchievementPage/AchievementDetails.dart';
import '../../Models/AchievementPage/AchievementsPage.dart';
import '../../Models/AchievementPage/AddAchievement.dart';
import '../../Models/ComplaintPage/ComplaintDetails.dart';
import '../../Models/ComplaintPage/ComplaintPage.dart';
import '../../Models/HomePage/Home.dart';
import '../../Models/Login/ForgetPasswordPage/ForgetPasswordPage.dart';
import '../../Models/Login/ForgetPasswordPage/VerifyMyEmail.dart';
import '../../Models/Login/LoginPage/LoginPage.dart';
import '../../Models/Login/SignUpPage/SignupPage.dart';
import '../../Models/Onboarding/OnBoardingPages.dart';
import '../../Models/Onboarding/letsStart.dart';
import '../../Models/SubscriptionPage/SubscriptionPage.dart';
import '../../Models/layoutView/layoutView.dart';
import '../../Models/profile/changeLan.dart';
import '../../Models/splashScreen/splashScreen.dart';
import 'AppRouteName.dart';

class AppConfig {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRouteName.initial:
        return MaterialPageRoute(builder: (context) => SplashScreen());

      case AppRouteName.Home:
        return MaterialPageRoute(builder: (context) => Home());
      case AppRouteName.LayoutView:
        return MaterialPageRoute(builder: (context) => LayoutView());

      case AppRouteName.AchievementsPage:
        return MaterialPageRoute(builder: (context) => AchievementsPage());

      case AppRouteName.Subscriptionpage:
        return MaterialPageRoute(builder: (context) => Subscriptionpage());

      case AppRouteName.ComplaintPage:
        return MaterialPageRoute(builder: (context) => ComplaintPage());

      case AppRouteName.LoginPage:
        return MaterialPageRoute(builder: (context) => LoginPage());

      case AppRouteName.SignupPage:
        return MaterialPageRoute(builder: (context) => SignupPage());

      case AppRouteName.ForgetPasswordPage:
        return MaterialPageRoute(builder: (context) => ForgetPasswordPage());

      case AppRouteName.AddAchievement:
        return MaterialPageRoute(builder: (context) => AddAchievement());

      case AppRouteName.AchievementDetails:
        return MaterialPageRoute(builder: (context) => AchievementDetails());

      case AppRouteName.ForgetPasswordPage:
        return MaterialPageRoute(builder: (context) => ForgetPasswordPage());

      case AppRouteName.AddComplaint:
        return MaterialPageRoute(builder: (context) => AddComplaint());

      case AppRouteName.ComplaintDetails:
        return MaterialPageRoute(builder: (context) => ComplaintDetails());

      case AppRouteName.OnBoardingPage:
        return MaterialPageRoute(builder: (context) => OnBoardingPage());

      case AppRouteName.letsStart:
        return MaterialPageRoute(builder: (context) => letsStart());

      case AppRouteName.ChangeLanguage:
        return MaterialPageRoute(builder: (context) => ChangeLanguage());

      case AppRouteName.VerifyMyEmail:
        return MaterialPageRoute(builder: (context) => VerifyMyEmail());
    }
  }
}
