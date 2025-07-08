import 'package:flutter/material.dart';
import 'package:islamy/utils/App_Colors.dart';
import 'package:islamy/utils/App_Style.dart';

class SuraContentItem extends StatelessWidget {
  final String suraContent;
  final int index;

  const SuraContentItem({
    super.key,
    required this.suraContent,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1), // 🔸 عشان يبان
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: AppColors.primaryColor, width: 2),
      ),
      child: Text(
        '$suraContent [${index + 1}]',
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.center,
        style: AppStyle.bold20primary,
      ),
    );
  }
}
