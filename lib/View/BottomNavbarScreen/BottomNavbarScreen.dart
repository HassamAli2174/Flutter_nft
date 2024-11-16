import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:nfts/Constants/ColorConstants.dart';
import 'package:nfts/Controller/BottomNavbarController.dart';
import 'package:nfts/View/HomeScreen/HomeScreen.dart';
import 'package:nfts/View/MyGalleryScreen/MyGalleryScreen.dart';
import 'package:nfts/View/NotificationScreen/NotificationScreen.dart';
import 'package:nfts/View/ProfileScreen/ProfileScreen.dart';

class BottomNavbarScreen extends StatelessWidget {
  // Use Get.find() to find an existing controller or create it if it does not exist
  // final BottomNavbarController bottomNavbarController =
  //     Get.find<BottomNavbarController>();
  final BottomNavbarController bottomNavbarController =
      Get.put(BottomNavbarController());

  BottomNavbarScreen({super.key});

  Widget buildBottomNavigationMenu(BuildContext context) {
    return Obx(() => MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: TextScaler.linear(1.0)),
          child: SizedBox(
            height: 70.h,
            child: BottomNavigationBar(
              elevation: 0,
              type:
                  BottomNavigationBarType.fixed, // Ensures the items are fixed
              showUnselectedLabels: true,
              showSelectedLabels: true,
              onTap: bottomNavbarController.changeTabIndex,
              currentIndex: bottomNavbarController.tabIndex.value,
              backgroundColor: Colors.black,
              unselectedItemColor: Colors.white.withOpacity(0.5),
              selectedItemColor: Colors.white,
              unselectedLabelStyle: TextStyle(
                color: Colors.white.withOpacity(0.5),
                fontWeight: FontWeight.w500,
                fontSize: 12
                    .sp, // Use ScreenUtil to ensure consistency across devices
              ),
              selectedLabelStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
              ),
              items: [
                BottomNavigationBarItem(
                  icon: _buildIcon(Icons.home, 0),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: _buildIcon(Icons.browse_gallery,  1),
                  label: 'Gallery',
                ),
                BottomNavigationBarItem(
                  icon: _buildIcon(Icons.notifications,  2),
                  label: 'Notifications',
                ),
                BottomNavigationBarItem(
                  icon: _buildIcon(Icons.person,  3),
                  label: 'Profile',
                ),
              ],
            ),
          ),
        ));
  }

  Widget _buildIcon(IconData iconData, int index) {
    bool isSelected = bottomNavbarController.tabIndex.value == index;
    return Container(
      height: 40.h,
      width: 90.w,
      decoration: BoxDecoration(
        color: isSelected ? primaryColor.withOpacity(0.2) : Colors.transparent,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, size: 20.sp),
          SizedBox(width: 5.w)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: buildBottomNavigationMenu(context),
        body: Obx(() => IndexedStack(
              index: bottomNavbarController.tabIndex.value,
              children: [
                HomeScreen(),
                const ProfileScreen(),
                const MyGalleryScreen(),
                const NotificationScreen(),
              ],
            )),
      ),
    );
  }
}
