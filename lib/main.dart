import 'package:flutter/material.dart';
import 'package:islamy/ui/home/home_screen.dart';
import 'package:islamy/utils/app_Theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
     initialRoute: HomeScreen.routName,
       routes:{
        HomeScreen.routName :(context)=> HomeScreen(),
       },
       darkTheme: AppTheme.darkTheme, 
       themeMode: ThemeMode.dark,
    );
  
  }
  
}
