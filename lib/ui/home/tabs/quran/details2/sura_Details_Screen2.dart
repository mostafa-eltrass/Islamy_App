// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:islamy/ui/home/tabs/quran/details/sura_content_item.dart';
// import 'package:islamy/ui/home/tabs/quran/details2/sura_content_item2.dart';
// import 'package:islamy/ui/home/tabs/quran/quran_resources.dart';
// import 'package:islamy/utils/App_Assets.dart';
// import 'package:islamy/utils/App_Colors.dart';
// import 'package:islamy/utils/App_Style.dart';

// class SuraDetailsScreen2 extends StatefulWidget {
//   static const String routeName = 'Sura-Details';

//   @override
//   State<SuraDetailsScreen2> createState() => _SuraDetailsScreen2State();
// }

// class _SuraDetailsScreen2State extends State<SuraDetailsScreen2> {
//   String suraContent = '';
//   late int index;
//   bool isLoading = true;

//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     index = ModalRoute.of(context)?.settings.arguments as int;

//     // تحميل ملف السورة بعد عرض الشاشة
//     Future.delayed(Duration(milliseconds: 100), () {
//       loadSuraFile(index);
//       setState(() {
//         isLoading = false;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setEnabledSystemUIMode(
//       SystemUiMode.manual,
//       overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
//     );

//     return Scaffold(
//       backgroundColor: Colors.black,
//       appBar: AppBar(
//         title: Text(
//           QuranResources.englishQuranList[index],
//           style: AppStyle.bold20primary,
//         ),
//         backgroundColor: Colors.black,
//         elevation: 0,
//       ),
//       body: Stack(
//         alignment: Alignment.topCenter,
//         children: [
//           /// ✅ الخلفية
//           Positioned.fill(child: Image.asset(AppAssets.ms, fit: BoxFit.fill)),

//           /// ✅ اسم السورة بالعربي في الأعلى
//           Padding(
//             padding: const EdgeInsets.only(top: 25, left: 5, right: 5),
//             child: Text(
//               QuranResources.arabicQuranList[index],
//               style: AppStyle.bold24primary,
//               textAlign: TextAlign.center,
//             ),
//           ),

//           /// ✅ المحتوى أو اللودر
//           if (isLoading || suraContent.isEmpty)
//             Center(
//               child: CircularProgressIndicator(color: AppColors.primaryColor),
//             )
//           else
//             SafeArea(
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                   top: 100,
//                   left: 16,
//                   right: 16,
//                   bottom: 32,
//                 ),
//                child:  SingleChildScrollView(child: SuraContentItem2(suraContent: suraContent)) 
//               ),
//             ),
//         ],
//       ),
//     );
//   }

//   void loadSuraFile(int index) async {
//     String fileContent = await rootBundle.loadString(
//       'assets/files/${index + 1}.txt',
//     );
//     List<String> lines = fileContent.trim().split('\n');
//     for (int i = 0; i <  lines.length; i++) {
//       lines[i] += '[${i + 1}]';
//     }
//     suraContent = lines.join();
//     setState(() {});
//   }
// }
