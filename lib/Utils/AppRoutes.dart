import 'package:alkebulan/App%20Screeens/Auka%20GPT/Auka%20GPT%20Screen.dart';
import 'package:alkebulan/App%20Screeens/Auth%20Screens/LoginScreen.dart';
import 'package:alkebulan/App%20Screeens/Auth%20Screens/ReferAFriendScreen.dart';
import 'package:alkebulan/App%20Screeens/Auth%20Screens/SignUp.dart';
import 'package:alkebulan/App%20Screeens/Home/HomeScreen.dart';
import 'package:alkebulan/App%20Screeens/Home/PostDetails/PostCommentsScreen.dart';
import 'package:alkebulan/App%20Screeens/Home/PostDetails/PostDetailsScreen.dart';
import 'package:alkebulan/App%20Screeens/Lates%20Articles/LatestArticlesScreen.dart';
import 'package:alkebulan/App%20Screeens/OnBoarding/OnBoarding2.dart';
import 'package:alkebulan/App%20Screeens/OnBoarding/Onboarding1.dart';
import 'package:alkebulan/App%20Screeens/OnBoarding/PaymentScreen.dart';
import 'package:alkebulan/App%20Screeens/Trending%20Posts/Trending%20Screen.dart';
import 'package:alkebulan/App%20Screeens/User%20Profile%20&%20Settings/SettingsScreen.dart';
import 'package:alkebulan/Common%20Components/BottomBar.dart';

import 'package:get/get.dart';

class AppRoutes {
  static const String onboarding1 = '/onboarding1';
  static const String onboarding2 = '/onboarding2';
  static const String onboarding3 = '/onboarding3';

  static const String RFA = '/RFA';
  static const String bnb = '/bnb';
  static const String signup = '/signup';
  static const String login = '/login';
  static const String home = '/home';
  static const String settings = '/settings';

  static const String latestArticles = '/latestArticles';
  static const String trendingScreen = '/trendingScreen';
  static const String aukaGPT = '/aukaGPT';
  static const String postDetailsScreen = '/postDetailsScreen';
  static const String postCommentsScreen = '/postCommentsScreen';

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
    GetPage(
      name: login,
      page: () => LoginScreen(),
    ),
    GetPage(name: RFA, page: () => ReferFriendScreen()),
    GetPage(name: bnb, page: () => DBNBPage()),
    GetPage(name: home, page: () => HomeScreen()),
    GetPage(name: settings, page: () => SettingsScreen()),
    GetPage(name: latestArticles, page: () => LatestArticlesScreen()),
    GetPage(name: trendingScreen, page: () => TrendingScreen()),
    GetPage(name: aukaGPT, page: () => AukaGPTScreen()),
    GetPage(name: postDetailsScreen, page: () => PostDetailScreen()),
    GetPage(
        name: postCommentsScreen,
        page: () => PostCommentsScreen(
              reelId: 1,
            )),
  ];
}
