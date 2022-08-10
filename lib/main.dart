import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';

import 'package:get/get.dart';

import 'package:kalajam/style.dart';
import 'package:kalajam/views/screens/auth/login_screen.dart';
import 'package:kalajam/views/screens/app_screen.dart';
import 'package:kalajam/controllers/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) {
    Get.put(AuthController())
      .addLoginListener((loggedIn) {
        Get.offAll(() => loggedIn ? AppScreen() : LoginScreen());
      });
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tiktik',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: KalaStyle.backgroundColor,
      ),
      home: LoginScreen(),
    );
  }
}
