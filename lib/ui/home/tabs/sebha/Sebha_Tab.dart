import 'package:flutter/material.dart';
import 'package:islamy/utils/app_Theme.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  List<String> tasbhWord = ['سبحان الله', 'الحمد لله', 'الله اكبر'];
  int counter = 0;
  int index = 0;
  double angle = 1;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'سبح اسم ربك الاعلي ',
          style: AppTheme.darkTheme.textTheme.headlineLarge?.copyWith(
            fontSize: 26,
          ),
        ),
        Stack(
          alignment: Alignment.topCenter,
          children: [
            Image.asset('assets/images/Mask group.png'),
            Container(
              margin: const EdgeInsets.only(top: 80),
              height: 200,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      handelTasbeeh();
                    },
                    child: Transform.rotate(
                      angle: -angle,
                      child: Image.asset(
                        'assets/images/SebhaBody 1.png',
                        height: 200,
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        tasbhWord[index],
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      SizedBox(height: 8),
                      Text(
                        '$counter',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }

  void handelTasbeeh() {
    setState(() {
      if (counter == 33) {
        counter = 0;

        index = (index + 1) % tasbhWord.length;
      } else {
        counter++;
      }
    });
    angle += 1;
  }
}
