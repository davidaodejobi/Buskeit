// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'package:buskeit/constant/constant.dart';
import 'package:buskeit/shared/margin.dart';

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
                  page: Page.one,
                  pageController: pageController,
                ),
                OnboardingPage(
                  size: size,
                  imageUrl: 'assets/images/onbaord-image.png',
                  title: 'Welcome to Buskeit',
                  description:
                      'Buskeit is a platform that helps you to manage your business and make it grow faster and better than ever',
                  page: Page.two,
                  pageController: pageController,
                ),
                OnboardingPage(
                  size: size,
                  imageUrl: 'assets/images/onbaord-image.png',
                  title: 'Welcome to Buskeit',
                  description:
                      'Buskeit is a platform that helps you to manage your business and make it grow faster and better than ever',
                  page: Page.three,
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
            Positioned(
              top: 10,
              right: 16,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white.withAlpha(100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  'Skip',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        color: Colors.black,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum Page { one, two, three }

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    Key? key,
    required this.size,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.page,
    required this.pageController,
  }) : super(key: key);

  final Size size;
  final String imageUrl;
  final String title;
  final String description;
  final Page page;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            SizedBox(
              height: size.height * 0.6,
              width: size.width,
            ),
            Positioned(
              bottom: -50,
              child: Container(
                height: size.height * 0.6,
                width: size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    // fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(page == Page.one ? 40 : 0),
                topRight: Radius.circular(page == Page.three ? 40 : 0),
              ),
            ),
            // height: double.infinity,
            width: size.width,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 40,
                left: 16,
                right: 16,
                bottom: 20,
              ),
              child: Stack(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            title,
                            style:
                                Theme.of(context).textTheme.headline3!.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                          const YMargin(20),
                          Text(
                            description,
                            textAlign: TextAlign.center,
                            style:
                                Theme.of(context).textTheme.headline5!.copyWith(
                                      color: Colors.white,
                                    ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        pageController.animateToPage(
                          2,
                          duration: const Duration(milliseconds: 1000),
                          curve: Curves.easeIn,
                        );
                      },
                      child: page == Page.three
                          ? Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                              ),
                              height: 45,
                              decoration: BoxDecoration(
                                color: AppColor.accentColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  'Get Started',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                        color: Colors.white,
                                      ),
                                ),
                              ),
                            )
                          : Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                color: AppColor.accentColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
