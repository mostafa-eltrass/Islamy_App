import 'package:flutter/material.dart';
import 'package:islamy/providers/most_recent_provider.dart';
import 'package:islamy/ui/home/tabs/quran/quran_resources.dart';
import 'package:islamy/utils/App_Assets.dart';
import 'package:islamy/utils/App_Colors.dart';
import 'package:islamy/utils/App_Style.dart';
import 'package:islamy/utils/shared_prefs.dart';
import 'package:provider/provider.dart';

class MostRecentWidget extends StatefulWidget {
  MostRecentWidget({super.key});

  @override
  State<MostRecentWidget> createState() => _MostRecentWidgetState();
}

class _MostRecentWidgetState extends State<MostRecentWidget> {
  late MostRecentProvider mostRecentProvider;
  @override
 @override
void initState() {
  super.initState();
  WidgetsBinding.instance.addPostFrameCallback((_) {
    mostRecentProvider.getMostRecentSuraList();
  });
}
      
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var mostRecentProvider = Provider.of<MostRecentProvider>(context);
    return mostRecentProvider.mostRecentList.isEmpty
        ? SizedBox()
        : Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Most Recently', style: AppStyle.bold16White),
            SizedBox(height: height * 0.01),

            /// ✅ قائمة مقترحة (مثال)
            SizedBox(
              height: height * 0.15,
              width: double.infinity,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.primaryColor,
                    ),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              QuranResources.englishQuranList[mostRecentProvider
                                  .mostRecentList[index]],
                              style: AppStyle.bold24Black,
                            ),
                            Text(
                              QuranResources.arabicQuranList[mostRecentProvider
                                  .mostRecentList[index]],
                              style: AppStyle.bold24Black,
                            ),
                            Text(
                              '${QuranResources.versesNumberList[mostRecentProvider.mostRecentList[index]]} verses ',
                              style: AppStyle.bold14Black,
                            ),
                          ],
                        ),
                        Image.asset(AppAssets.icontoot),
                      ],
                    ),
                  );
                },
                separatorBuilder:
                    (context, index) => SizedBox(width: width * 0.01),
                itemCount: mostRecentProvider.mostRecentList.length,
              ),
            ),
          ],
        );
  }
}
