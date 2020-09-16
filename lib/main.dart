import 'package:flu_link_short/controllers/linkRegisterController.dart';
import 'package:flu_link_short/controllers/signupcontroller.dart';
import 'package:flu_link_short/controllers/userController.dart';
import 'package:flu_link_short/pages/all/login.dart';
import 'package:flu_link_short/pages/all/singup.dart';
import 'package:flu_link_short/pages/all/welcome.dart';
import 'package:flu_link_short/pages/user/home.dart';
import 'package:flu_link_short/pages/user/linkRegister.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final SignUpController controller = Get.put(SignUpController());
  final UserController userController = Get.put(UserController());
  final LinkRegisterController linkController =
      Get.put(LinkRegisterController());
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Short Link',
      initialRoute: '/',
      localizationsDelegates: [GlobalMaterialLocalizations.delegate],
      supportedLocales: [const Locale('pt')],
      getPages: [
        GetPage(name: '/', page: () => WelcomePage()),
        GetPage(name: '/signup', page: () => SignUpPage()),
        GetPage(name: '/login', page: () => Loginpage()),
        GetPage(name: '/home', page: () => HomePage()),
        GetPage(name: '/registerLink', page: () => LinkRegisterPage())
      ],
    );
  }
}
