import 'package:hackcbs/utils/cache_language.dart';
import 'package:hackcbs/utils/light_theme.dart';
import 'package:hackcbs/utils/theme.dart';
import 'package:hackcbs/views/error.dart';
import 'package:hackcbs/views/home/home_tab.dart';

import 'package:hackcbs/views/onboarding/login.dart';

import 'package:hackcbs/views/onboarding/signup.dart';
import 'package:hackcbs/views/onboarding/splash.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:json_theme/json_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheLanguage.init();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeDecoder.decodeThemeData(theme),
      initialRoute: '/splash',
      title: "Sanjivani",
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/splash':
            return MaterialPageRoute(builder: (_) => const SplashScreen());

          case '/home':
            return MaterialPageRoute(builder: (_) => const HomeTabPage());

          case '/login':
            return MaterialPageRoute(builder: (_) => const LoginPage());

          case '/signup':
            return MaterialPageRoute(builder: (_) => SignUpPage());

          case '/error':
            return MaterialPageRoute(builder: (_) => const ErrorScreen());

          default:
            return MaterialPageRoute(builder: (_) => const LoginPage());
        }
      },
    );
  }
}
