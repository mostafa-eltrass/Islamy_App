import 'package:flutter/material.dart';
import 'package:islamy/ui/home/tabs/quran/details/sura_Details_Screen.dart';
import 'package:islamy/ui/home/tabs/quran/details2/sura_Details_Screen2.dart';
import 'package:islamy/ui/home/tabs/quran/quran_resources.dart';
import 'package:islamy/ui/home/tabs/quran/sura_item.dart';
import 'package:islamy/utils/App_Assets.dart';
import 'package:islamy/utils/App_Colors.dart';
import 'package:islamy/utils/App_Style.dart';

class QuranTab extends StatefulWidget {
  QuranTab({super.key});

  @override
  State<QuranTab> createState() => _QuranTabState();
}

class _QuranTabState extends State<QuranTab> {
  List<int> filterList = List.generate(114, (index) => index);
  bool showContainers = true; // ✅ الوضع الافتراضي لزرار العرض

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ✅ مربع البحث
          TextField(
            onChanged: (newText) {
              searchByNewText(newText);
            },
            style: AppStyle.bold20White,
            cursorColor: AppColors.primaryColor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide:
                    BorderSide(color: AppColors.primaryColor, width: 2),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide:
                    BorderSide(color: AppColors.primaryColor, width: 2),
              ),
              prefixIcon: Image.asset(AppAssets.IconSearch),
              hintText: 'Sura Name',
              hintStyle: AppStyle.bold16White,
            ),
          ),

          SizedBox(height: height * 0.02),

          /// ✅ العنوان
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
                          Text('AL_Anbiya', style: AppStyle.bold24Black),
                          Text('الانبياء', style: AppStyle.bold24Black),
                          Text('112', style: AppStyle.bold14Black),
                        ],
                      ),
                      Image.asset(AppAssets.icontoot),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) =>
                  SizedBox(width: width * 0.01),
              itemCount: 10,
            ),
          ),

          SizedBox(height: height * 0.02),

          /// ✅ زرارين لتحديد طريقة العرض
          Text('Suras List', style: AppStyle.bold16White),
          SizedBox(height: height * 0.01),

          /// ✅ قائمة السور
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      // يمكنك تبديل الشاشات هنا حسب showContainers
                      SuraDetailsScreen.routeName,
                      // SuraDetailsScreen2.routeName,
                      arguments: filterList[index],
                    );
                  },
                  child: SuraItem(index: filterList[index]),
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: AppColors.WhiteColor,
                  thickness: 2,
                  indent: width * 0.1,
                  endIndent: width * 0.05,
                );
              },
              itemCount: filterList.length,
            ),
          ),
        ],
      ),
    );
  }

  void searchByNewText(String newText) {
    if (newText.trim().isEmpty) {
      // ✅ لو المستخدم مسح البحث، ارجع للقائمة الأصلية
      setState(() {
        filterList = List.generate(114, (index) => index);
      });
      return;
    }

    Set<int> filterSearchSet = {};

    for (int i = 0; i < QuranResources.englishQuranList.length; i++) {
      if (QuranResources.englishQuranList[i]
          .toLowerCase()
          .contains(newText.toLowerCase())) {
        filterSearchSet.add(i);
      }
      if (QuranResources.arabicQuranList[i].contains(newText)) {
        filterSearchSet.add(i);
      }
    }

    setState(() {
      filterList = filterSearchSet.toList();
    });
  }
}
