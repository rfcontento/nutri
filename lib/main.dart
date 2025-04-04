import 'package:component/theme/global_theme_light.dart';
import 'package:driver/ui/page/splash/splash_screen.dart';
import 'package:driver/ui/routes/route_page.dart';
import 'package:driver/ui/routes/route_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: GlobalThemeLight().themeDataLight(),
        initialRoute: SplashScreen.route,
        routes: routes(),

      ),
    );
  }
}
