import 'package:alkebulan/App%20Screeens/Auth%20Screens/ReferAFriendScreen.dart';
import 'package:alkebulan/App%20Screeens/Auth%20Screens/SignUp.dart';
import 'package:alkebulan/App%20Screeens/Home/HomeScreen.dart';
import 'package:alkebulan/App%20Screeens/OnBoarding/OnBoarding2.dart';
import 'package:alkebulan/App%20Screeens/OnBoarding/Onboarding1.dart';
import 'package:alkebulan/App%20Screeens/OnBoarding/PaymentScreen.dart';
import 'package:alkebulan/App%20Screeens/User%20Profile%20&%20Settings/SettingsScreen.dart';
import 'package:alkebulan/Common%20Components/BottomBar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const String onboarding1 = '/onboarding1';
  static const String onboarding2 = '/onboarding2';
  static const String onboarding3 = '/onboarding3';

  static const String RFA = '/RFA';
  static const String bnb = '/bnb';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String settings = '/settings';

  static final routes = [
    GetPage(
      name: onboarding1,
      page: () => OnboardingOne(),
    ),
    GetPage(
      name: onboarding2,
      page: () => OnboardingTwo(),
    ),
    GetPage(
      name: onboarding3,
      page: () => PaymentScreen(),
    ),
    GetPage(name: signup, page: () => SignUpScreen()),
    GetPage(name: RFA, page: () => ReferFriendScreen()),
    GetPage(name: bnb, page: () => DBNBPage()),
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: settings, page: () => SettingsScreen()),
  ];
}
