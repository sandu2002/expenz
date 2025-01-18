import 'package:expenz/data/onboarding_data.dart';
import 'package:expenz/screens/onboarding/front_page.dart';
import 'package:expenz/screens/onboarding/shared_onboarding_screen.dart';
import 'package:expenz/utils/colors.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  //Page controller
  final PageController _controller = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                PageView(
                  controller: _controller,
                  children: [
                    FrontPage(),
                    SharedOnboardingScreen(
                      title: OnboardingData.onboardingDataList[0].title,
                      description:
                          OnboardingData.onboardingDataList[0].Description,
                      imagepath: OnboardingData.onboardingDataList[0].ImagePath,
                    ),
                    SharedOnboardingScreen(
                      title: OnboardingData.onboardingDataList[1].title,
                      description:
                          OnboardingData.onboardingDataList[1].Description,
                      imagepath: OnboardingData.onboardingDataList[1].ImagePath,
                    ),
                    SharedOnboardingScreen(
                      title: OnboardingData.onboardingDataList[2].title,
                      description:
                          OnboardingData.onboardingDataList[2].Description,
                      imagepath: OnboardingData.onboardingDataList[2].ImagePath,
                    ),
                  ],
                ),
                //Page dot indicator
                Container(
                  alignment: Alignment(0, 0.75),
                  child: SmoothPageIndicator(
                    controller: _controller,
                    count: 4,
                    effect: WormEffect(
                      activeDotColor: kMainColor,
                      dotColor: kLightGrey,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
