import 'package:flutter/material.dart';
import 'package:islamy/providers/most_recent_provider.dart';
import 'package:islamy/ui/home/home_screen.dart';
import 'package:islamy/ui/home/tabs/quran/details/sura_Details_Screen.dart';
import 'package:islamy/ui/home/tabs/quran/details2/sura_Details_Screen2.dart';
import 'package:islamy/ui/home/tabs/sebha/Sebha_Tab.dart';
import 'package:islamy/ui/onboarding/onboarding_screen.dart';
import 'package:islamy/utils/app_Theme.dart';
import 'package:provider/provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await Future.delayed(Duration(milliseconds: 500));
  runApp(ChangeNotifierProvider(
    create: (context)=> MostRecentProvider(),
    child:   MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',  
      routes: {
        '/': (context) =>   OnBoardingScreen(), 
        HomeScreen.routName: (context) =>   HomeScreen(), 
        SuraDetailsScreen.routeName:(context) => SuraDetailsScreen(),
          


        // SuraDetailsScreen2.routeName:(context) => SuraDetailsScreen2(),
        
      },
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.dark,
    );
  }
}
