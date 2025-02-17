import 'package:alkebulan/Utils/AppRoutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //  primaryColor: Color.fromRGBO(253, 156, 73, 1),
      //   elevatedButtonTheme: ElevatedButtonThemeData(
      //     style: ElevatedButton.styleFrom(
      //       backgroundColor: Color.fromRGBO(253, 156, 73, 1),
      //       foregroundColor: Colors.white,
      //       shape: RoundedRectangleBorder(
      //         borderRadius: BorderRadius.circular(10),
      //       ),
      //     ),
      //   ),
      // ),
      initialRoute: AppRoutes.onboarding1,
      getPages: AppRoutes.routes,
    );
  }
}
