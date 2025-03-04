import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nfts/Constants/ColorConstants.dart';
import 'package:nfts/Routes/Routes.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.cyan,
            textTheme: TextTheme(
              bodyLarge: TextStyle(
                  fontFamily: "CeraGR", fontSize: 10.sp, color: whiteColor),
              bodyMedium: GoogleFonts.jost(fontSize: 10.sp, color: whiteColor),
            ),
          ),
          debugShowCheckedModeBanner: false,
          getPages: AppRoutes.routes,
          initialRoute: AppRoutes.bottomNavbarScreen,
        );
      },
    );
  }
}
