import 'package:get/get.dart';
import 'package:nfts/View/BottomNavbarScreen/BottomNavbarScreen.dart';
import 'package:nfts/View/MyGalleryScreen/MyGalleryScreen.dart';
import 'package:nfts/View/NotificationScreen/NotificationScreen.dart';
import 'package:nfts/View/ProfileScreen/ProfileScreen.dart';

import '../View/HomeScreen/HomeScreen.dart';
import '../View/SplashScreen/SplashScreen.dart';

class AppRoutes {
  static String splash = "/";
  static String homeScreen = "/homeScreen";
  static String bottomNavbarScreen = "/bottomNavbarScreen";
  static String notificationScreen = "/notificationScreen";
  static String profileScreen = "/profileScreen";
  static String myGalleryScreen = "/myGalleryScreen";
  static String drawer = "/drawer";

  static List<GetPage<dynamic>> routes = [
    GetPage(
        name: splash,
        page: () => const SplashScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: homeScreen,
        page: () => HomeScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: bottomNavbarScreen,
        page: () => BottomNavbarScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: profileScreen,
        page: () => const ProfileScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: notificationScreen,
        page: () => const NotificationScreen(),
        transition: Transition.fadeIn),
    GetPage(
        name: myGalleryScreen,
        page: () => const MyGalleryScreen(),
        transition: Transition.fadeIn),
  ];
}
