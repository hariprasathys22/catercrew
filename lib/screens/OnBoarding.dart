import 'package:catercrews/data/OnBoardData.dart';
import 'package:catercrews/widgets/PageContentWidget.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _pageController = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(255, 249, 245, 1),
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "Skip",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
              itemCount: pages.length, // Number of pages based on the list
              itemBuilder: (context, index) {
                return PageContentWidget(
                  queryData: queryData,
                  data: pages[index],
                );
              },
            ),
          ),
          DotsIndicator(
            dotsCount: pages.length,
            position: currentPage.toDouble(),
            decorator: DotsDecorator(
              size: const Size.square(9.0),
              activeSize: const Size(25.0, 9.0),
              activeShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              color: Colors.grey.shade400,
              activeColor: const Color.fromRGBO(241, 110, 0, 1.0),
            ),
          ),
          const SizedBox(height: 30),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                if (currentPage > 0)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _pageController.previousPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                          side: BorderSide(color: Colors.grey.shade300),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      child: const Text("Back"),
                    ),
                  ),
                if (currentPage > 0) const SizedBox(width: 16),
                Expanded(
                  flex: currentPage > 0 ? 1 : 2,
                  child: ElevatedButton(
                    onPressed: () {
                      if (currentPage == pages.length - 1) {
                        print("Onboarding finished!");
                        // Navigate to another screen or close the onboarding
                      } else {
                        _pageController.nextPage(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeInOut,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: const Color.fromRGBO(241, 110, 0, 1.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                    ),
                    child: Text(
                      currentPage == pages.length - 1 ? 'Get Started' : 'Next',
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 110),
        ],
      ),
    );
  }
}
