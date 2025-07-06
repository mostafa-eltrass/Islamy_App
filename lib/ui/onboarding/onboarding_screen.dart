import 'package:flutter/material.dart';
import 'package:islamy/ui/home/home_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int currentPage = 0;

  final List<Map<String, String>> pages = [
    {
      'image': 'assets/images/Frame11.png',
      'title': 'Welcome To Islami App',
      'description': '',
    },
    {
      'image': 'assets/images/Frame111.png',
      'title': 'Welcome To Islami',
      'description': 'We Are Very Excited To Have You In Our Community',
    },
    {
      'image': 'assets/images/Frame1.png',
      'title': 'Reading the Quran',
      'description': 'Read, and your Lord is the Most Generous',
    },
    {
      'image': 'assets/images/Frame1111.png',
      'title': 'Bearish',
      'description': 'Praise the name of your Lord, the Most High',
    },
    {
      'image': 'assets/images/Frame11111.png',
      'title': 'Holy Quran Radio',
      'description':
          'You can listen to the Holy Quran Radio through the application for free and easily',
    },
  ];

  void nextPage() {
    if (currentPage < pages.length - 1) {
      _pageController.nextPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      Navigator.pushReplacementNamed(context, HomeScreen.routName);
    }
  }

  void previousPage() {
    if (currentPage > 0) {
      _pageController.previousPage(
          duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentData = pages[currentPage];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // ✅ الشعار
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Image.asset('assets/images/logo.png', height: 90),
            ),

            const SizedBox(height: 10),

            // ✅ محتوى الصفحات
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                onPageChanged: (index) {
                  setState(() {
                    currentPage = index;
                  });
                },
                itemBuilder: (context, index) {
                  final page = pages[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          page['image']!,
                          height: MediaQuery.of(context).size.height * 0.5,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          page['title'] ?? '',
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        if ((page['description'] ?? '').isNotEmpty)
                          Text(
                            page['description']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.white70),
                          ),
                      ],
                    ),
                  );
                },
              ),
            ),

            // ✅ الدوتس
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(pages.length, (index) {
                bool isActive = index == currentPage;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                  width: isActive ? 22 : 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: isActive ? Colors.amber : Colors.white54,
                    borderRadius: BorderRadius.circular(25),
                  ),
                );
              }),
            ),

            // ✅ الأزرار
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  currentPage == 0
                      ? const SizedBox()
                      : TextButton(
                          onPressed: previousPage,
                          child: const Text("Back",
                              style: TextStyle(color: Colors.white)),
                        ),
                  TextButton(
                    onPressed: nextPage,
                    child: Text(
                      currentPage == pages.length - 1 ? "Finish" : "Next",
                      style: const TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
