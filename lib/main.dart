import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutterauthgetxstarter/view/screens/changepassword/change_password.dart';
import 'package:flutterauthgetxstarter/view/screens/home/home_screen.dart';
import 'package:flutterauthgetxstarter/view/screens/login/login_screen.dart';
import 'package:flutterauthgetxstarter/view/screens/start/start_screen.dart';
import 'package:flutterauthgetxstarter/utils/app_binding.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'view/screens/profile/profile_screen.dart';
import 'view/screens/register/register_screen.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter GetX Auth Starter',
      // home: HomeScreen(),
      builder: BotToastInit(),
      navigatorObservers: [BotToastNavigatorObserver()],
      initialRoute: '/',
      initialBinding: AppBinding(),
      getPages: [
        GetPage(name: '/', page: () => StartScreen()),
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/register', page: () => RegisterScreen()),
        GetPage(name: '/home', page: () => HomeScreen()),
        GetPage(name: '/profile', page: () => ProfileScreen()),
        GetPage(name: '/changePassword', page: () => ChangePasswordScreen()),
      ],
    );
  }
}
