import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islamy/model/hadeth.dart';
import 'package:islamy/utils/App_Assets.dart';
import 'package:islamy/utils/App_Colors.dart';

class HadethItem extends StatefulWidget {
  final int index;

  const HadethItem({super.key, required this.index});

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  Hadeth? hadeth;

  @override
  void initState() {
    super.initState();
    loadHadethFile(widget.index);
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02, vertical: height * 0.02),

      margin: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.primaryColor,
        image:DecorationImage(image: AssetImage(AppAssets.hadethDetailsBg))
      ),
       
      child: hadeth == null
          ? Center(
              child: CircularProgressIndicator(color: AppColors.blackColor),
            )
          : Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                        Image.asset(AppAssets.hadethCornerLift,
                        width: width*0.10,
                        ),
                      Expanded(
                        child: Text(
                                          hadeth!.title,
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.blackColor,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                      ),
                   Image.asset(AppAssets.hadethCornerRight,
                   width: width*0.10,
                   )
                  ],
                ),
               
                const SizedBox(height: 16),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      hadeth!.content,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.blackColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Image.asset(AppAssets.hadethMosque)
              ],
            ),
    );
  
  
  }

  void loadHadethFile(int index) async {
    try {
      String fileContent = await rootBundle.loadString(
        'assets/Hadeeth/h$index.txt',
      );
      int titleEndIndex = fileContent.indexOf('\n');
      String title = fileContent.substring(0, titleEndIndex).trim();
      String content = fileContent.substring(titleEndIndex + 1).trim();

      hadeth = Hadeth(title: title, content: content);
      setState(() {});
    } catch (e) {
      print("⚠️ Error loading hadeth file: $e");
    }
  }
}
