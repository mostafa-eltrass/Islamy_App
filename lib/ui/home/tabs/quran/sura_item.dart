import 'package:flutter/material.dart';
import 'package:islamy/utils/App_Assets.dart';
import 'package:islamy/utils/App_Style.dart';

class SuraItem extends StatelessWidget {
  const SuraItem({super.key});

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
            Text('1', style: AppStyle.bold16White),
          ],
        ),
       SizedBox( width: Width*0.06,),
        Column(
          children: [
            Text('AL_Fatiha', style: AppStyle.bold20White),

            Text('7 Verses', style: AppStyle.bold14White),
          ],
        ),
     
 Spacer()  ,
         Text('الفاتحه',
         style: AppStyle.bold20White,
         
         
         )
    ],
    );
  }
}
