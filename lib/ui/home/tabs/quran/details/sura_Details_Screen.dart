 

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/providers/most_recent_provider.dart';
import 'package:islamy/ui/home/tabs/quran/details/sura_content_item.dart';
import 'package:islamy/ui/home/tabs/quran/quran_resources.dart';
import 'package:islamy/utils/App_Assets.dart';
import 'package:islamy/utils/App_Colors.dart';
import 'package:islamy/utils/App_Style.dart';
import 'package:provider/provider.dart';

class SuraDetailsScreen extends StatefulWidget {
  static const String routeName = 'Sura-Details';

  @override
  State<SuraDetailsScreen> createState() => _SuraDetailsScreenState();
}

class _SuraDetailsScreenState extends State<SuraDetailsScreen> {
  List<String> verses = [];
  late MostRecentProvider mostRecentProvider;
  late int index;
  bool isLoading = true;

  @override
  void dispose() {
    super.dispose();
    mostRecentProvider.getMostRecentSuraList();
  }

  void didChangeDependencies() {
    super.didChangeDependencies();
    index = ModalRoute.of(context)?.settings.arguments as int;

    // تحميل ملف السورة
    Future.delayed(Duration(milliseconds: 100), () {
      loadSuraFile(index);
      setState(() {
        isLoading = false;
      });
    });
  }

  void loadSuraFile(int index) async {
    String fileContent = await rootBundle.loadString(
      'assets/files/${index + 1}.txt',
    );
    List<String> lines = fileContent.trim().split('\n');

    setState(() {
      verses = lines;
    });
  }

  @override
  Widget build(BuildContext context) {
    mostRecentProvider = Provider.of<MostRecentProvider>(context);
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
    );

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          QuranResources.englishQuranList[index],
          style: AppStyle.bold20primary,
        ),
        backgroundColor: Colors.black,
        elevation: 0,
      ),
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          /// ✅ الخلفية
          Positioned.fill(child: Image.asset(AppAssets.ms, fit: BoxFit.fill)),

          /// ✅ اسم السورة
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Text(
              QuranResources.arabicQuranList[index],
              style: AppStyle.bold24primary,
              textAlign: TextAlign.center,
            ),
          ),

          /// ✅ اللودر أو المحتوى
          if (isLoading || verses.isEmpty)
            Center(
              child: CircularProgressIndicator(color: AppColors.primaryColor),
            )
          else
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 100,
                  left: 16,
                  right: 16,
                  bottom: 32,
                ),
                child: ListView.builder(
                  itemCount: verses.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: SuraContentItem(suraContent: verses[i], index: i),
                    );
                  },
                ),
              ),
            ),
        ],
      ),
    );
  }
}
