

import 'package:driver/ui/page/home/home_screen.dart' show HomeScreen;
import 'package:driver/ui/page/login/login_screen.dart';
import 'package:driver/ui/page/splash/splash_screen.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> routes() {
  return <String, WidgetBuilder>{
    HomeScreen.route: (_) => const HomeScreen(),
    SplashScreen.route: (_) => const SplashScreen(),
    LoginScreen.route: (_) => const LoginScreen(),
  };
}
