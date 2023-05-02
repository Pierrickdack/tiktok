import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/screen/account/logup_page.dart';
import 'package:tiktok/screen/api/auth_controller.dart';
import 'package:tiktok/screen/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'screen/home.dart';
import 'screen/account/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => {
        Get.put(AuthController()),
      });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
