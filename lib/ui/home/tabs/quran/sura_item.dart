import 'package:flutter/material.dart';
import 'package:islamy/ui/home/tabs/quran/quran_resources.dart';
import 'package:islamy/utils/App_Assets.dart';
import 'package:islamy/utils/App_Style.dart';

class SuraItem extends StatelessWidget {
  int index;
    SuraItem({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    var Width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Row(
      children: [
        Stack(
          alignment: Alignment.center,
          children: [
            Image.asset(AppAssets.Vectoor),
            Text('${index+1}', style: AppStyle.bold16White),
          ],
        ),
        SizedBox(width: Width * 0.06),
        Column(
          children: [
            Text(QuranResources.englishQuranList[index], style: AppStyle.bold20White),

            Text(  ' ${QuranResources.versesNumberList[index]}  verses ', style: AppStyle.bold14White),
          ],
        ),

        Spacer(),
        Text(QuranResources.arabicQuranList[index], style: AppStyle.bold20White),
      ],
    );
  }
}
