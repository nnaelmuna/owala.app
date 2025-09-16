import 'package:flutter/material.dart';
import 'package:owala_app/data/onboarding_data.dart';
import 'package:owala_app/utils/consts.dart';
import 'package:owala_app/views/components/boarding_content.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
int currentPage = 0;
final PageController _pageController =PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // jika ingin memenuhi layar
            Expanded(
              flex: 7,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (value) {
                  // maksud dari kode ini adalah untuk memberi tahu
                  // setiap kalia ada perubahan yang ditrigger oleh adanya interaksi user
                  setState(() {
                    currentPage = value;
                  });
                },
                itemCount: onBoardingData.length,
                itemBuilder: (context, index) => OnboardingContent(
                  text: onBoardingData[index].text,
                  image: onBoardingData[index].image,
                ),
              ),
            ),
            Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    onBoardingData.length,
                    (index) => _dotsindicator(index: index)
                  ),
                ),
            ),
            
            Padding(
              padding: EdgeInsetsGeometry.symmetric(horizontal: 15, vertical: 30),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor
                  ),
                  onPressed: () {
                    if (currentPage == onBoardingData.length - 1) {
                      Navigator.pushNamed(context, '/login');
                    } else {
                      _pageController.animateToPage(
                        currentPage + 1,
                        duration: animationDuration,
                        curve: Curves.ease
                      );
                    }
                  },
                  child: Text(
                    // currentpage == 3 -1 ? 
                    currentPage == onBoardingData.length - 1 ? "Get Started" : "Next",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            )
          ],
        )
      ),
    );
  }

  AnimatedContainer _dotsindicator({required int index}) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: currentPage == index ? primaryColor : secondaryColor,
      ),
      width: currentPage == index ? 20 : 7,
      height: 5,
      duration: animationDuration,
    );

  }
}