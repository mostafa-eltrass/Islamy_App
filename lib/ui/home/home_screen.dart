import 'package:flutter/material.dart';
import 'package:islamy/ui/home/tabs/hadeth/Hadeth_Tab.dart';
import 'package:islamy/ui/home/tabs/quran/quran_tab.dart';
import 'package:islamy/ui/home/tabs/radio/Radio_Tab.dart';
import 'package:islamy/ui/home/tabs/sebha/Sebha_Tab.dart';
import 'package:islamy/ui/home/tabs/time/Time_Tab.dart';
import 'package:islamy/utils/App_Assets.dart';
import 'package:islamy/utils/App_Colors.dart';

class HomeScreen extends StatefulWidget {
  static const String routName = 'home_screen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndext = 0;
  List<String> backgroundImages = [
    AppAssets.QuranBg,
    AppAssets.sebhaBg,
    AppAssets.HadethBg,
    AppAssets.RadioBg,
    AppAssets.timeBg,
  ];
  List<Widget> Tabs = [
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    TimeTab(),
  ];
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          backgroundImages[selectedIndext],
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.fill,
        ),
        Scaffold(
          bottomNavigationBar: Theme(
            data: Theme.of(
              context,
            ).copyWith(canvasColor: AppColors.primaryColor),
            child: BottomNavigationBar(
              currentIndex: selectedIndext,
              onTap: (index) {
                selectedIndext = index;
                setState(() {});
              },
              // backgroundColor: AppColors.primaryColor,
              // type: BottomNavigationBarType.fixed,
              items: [
                BottomNavigationBarItem(
                  icon: builtBottomNavigationBar(
                    index: 0,
                    imageName: AppAssets.iconQuran,
                  ),
                  label: 'Quran',
                ),

                BottomNavigationBarItem(
                  icon: builtBottomNavigationBar(
                    index: 1,
                    imageName: AppAssets.iconQHadeth,
                  ),
                  label: 'health',
                ),
                BottomNavigationBarItem(
                  icon: builtBottomNavigationBar(
                    index: 2,
                    imageName: AppAssets.iconSebha,
                  ),
                  label: 'sebha',
                ),
                BottomNavigationBarItem(
                  icon: builtBottomNavigationBar(
                    index: 3,
                    imageName: AppAssets.iconSebha,
                  ),
                  label: 'sebha',
                ),
                BottomNavigationBarItem(
                  icon: builtBottomNavigationBar(
                    index: 4,
                    imageName: AppAssets.iconSebha,
                  ),
                  label: 'sebha',
                ),
              ],
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Image.asset(AppAssets.Logo),
            Expanded(child:  Tabs [selectedIndext])
            ],

          ),
        ),
      ],
    );
  }

  Widget builtBottomNavigationBar({
    required int index,
    required String imageName,
  }) {
    return selectedIndext == index
        ? Container(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(66),
            color: AppColors.blackByColor,
          ),

          child: ImageIcon(AssetImage((imageName))),
        )
        : ImageIcon(AssetImage((imageName)));
  }
}
