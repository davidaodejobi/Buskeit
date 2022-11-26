// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:buskeit/constant/constant.dart';

import 'view_models/onboarding_provider.dart';
import 'widgets/onboarding_page.dart';

class Onboarding extends StatelessWidget {
  Onboarding({Key? key}) : super(key: key);
  final pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              children: [
                OnboardingPage(
                  size: size,
                  imageUrl: 'assets/images/onbaord-image.png',
                  title: 'Welcome to Buskeit',
                  description:
                      'Buskeit is a platform that helps you to manage your business and make it grow faster and better than ever',
                  page: OnboardPage.one,
                  pageController: pageController,
                ),
                OnboardingPage(
                  size: size,
                  imageUrl: 'assets/images/onbaord-image.png',
                  title: 'Welcome to Buskeit',
                  description:
                      'Buskeit is a platform that helps you to manage your business and make it grow faster and better than ever',
                  page: OnboardPage.two,
                  pageController: pageController,
                ),
                OnboardingPage(
                  size: size,
                  imageUrl: 'assets/images/onbaord-image.png',
                  title: 'Welcome to Buskeit',
                  description:
                      'Buskeit is a platform that helps you to manage your business and make it grow faster and better than ever',
                  page: OnboardPage.three,
                  pageController: pageController,
                ),
              ],
            ),
            Positioned(
              bottom: 16,
              left: 16,
              child: SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: const JumpingDotEffect(
                  jumpScale: 2.0,
                  dotColor: Colors.white,
                  activeDotColor: AppColor.accentColor,
                  dotHeight: 12,
                  dotWidth: 12,
                  spacing: 8,
                ),
              ),
            ),
            Consumer<OnBoardingProvider>(
              builder: (_, value, __) {
                return Positioned(
                  top: 10,
                  right: 16,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white.withAlpha(100),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onPressed: () {
                      value.setHasSeenOnboarding(context);
                    },
                    child: Text(
                      'Skip',
                      style: Theme.of(context).textTheme.headline5!.copyWith(
                            color: Colors.black,
                          ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
