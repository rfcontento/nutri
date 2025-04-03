import 'package:component/theme/global_theme_light.dart';
import 'package:driver/ui/page/home/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: GlobalThemeLight().themeDataLight(),
      home: HomeScreen(),

    );
  }
}
