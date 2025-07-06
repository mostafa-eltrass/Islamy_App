import 'package:flutter/material.dart';
import 'package:islamy/ui/home/home_screen.dart';
import 'package:islamy/ui/onboarding/onboarding_screen.dart';
import 'package:islamy/utils/app_Theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/', // نبدأ من شاشة Onboarding
      routes: {
        '/': (context) =>   OnBoardingScreen(), // شاشة Onboarding
        HomeScreen.routName: (context) =>   HomeScreen(), // الشاشة الرئيسية
      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
