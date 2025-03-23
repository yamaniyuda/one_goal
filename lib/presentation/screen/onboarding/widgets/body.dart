import 'package:flutter/material.dart';
import 'package:one_goal/data/data.dart';
import 'package:go_router/go_router.dart';
import 'package:one_goal/presentation/screen/onboarding/models/onboarding_page_model.dart';


import 'onboarding_controls.dart';
import 'onboarding_dots.dart';
import 'onboarding_pages.dart';

final List<OnboardingPageModel> onboardingPages = [
  OnboardingPageModel(
    title: [
      OnboardingPageTitle(
        text: 'SS collection of\n',
        color: Color(0XFF000000),
      ),
      OnboardingPageTitle(
        text: 'indoor & outdoor ',
        color: Color(0xFF4B8E4B),
      ),
      OnboardingPageTitle(
        text: 'plants',
        color: Color(0xFF4B8E4B),
      ),
    ],
    description:
        'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit. Fringilla in sed risus sit.',
    image: 'assets/images/onboarding/onboarding1.png',
  ),
  OnboardingPageModel(
    title: [
      OnboardingPageTitle(
        text: 'Keep your \n',
        color: Color(0XFF000000),
      ),
      OnboardingPageTitle(
        text: 'plants ',
        color: Color(0XFF000000),
      ),
      OnboardingPageTitle(
        text: 'alive',
        color: Color(0xFF4B8E4B),
      ),
    ],
    description:
        'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit. Fringilla in sed risus sit.',
    image: 'assets/images/onboarding/onboarding2.png',
  ),
  OnboardingPageModel(
    title: [
      OnboardingPageTitle(
        text: 'Plan a tree &\n',
        color: Color(0XFF000000),
      ),
      OnboardingPageTitle(
        text: 'green the ',
        color: Color(0XFF000000),
      ),
      OnboardingPageTitle(
        text: 'earth',
        color: Color(0xFF4B8E4B),
      ),
    ],
    description:
        'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit. Fringilla in sed risus sit.',
    image: 'assets/images/onboarding/onboarding3.png',
  ),
];

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final PageController _pageController = PageController();
  int _indexSelected = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: OnboardingPages(
              pages: onboardingPages,
              controller: _pageController,
              onPageChanged: _onPageChanged,
            ),
          ),
          
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  OnboardingDots(
                    dotsLength: onboardingPages.length,
                    indexSelected: _indexSelected,
                    onDotPressed: _onDotPressed,
                  ),
                  const SizedBox(height: 40),
                  OnboardingControls(
                    isLastPage: _indexSelected == onboardingPages.length - 1,
                    onSkipPressed: _onSkipPressed,
                    onNextPressed: _onNextPressed,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // Functions
  _onSkipPressed() {
    _navigateToHomePage();
  }

  _onNextPressed() {
    setState(() {
      _indexSelected++;
    });

    if (_indexSelected != onboardingPages.length) {
      _animateToPage();
      return;
    }

    _navigateToHomePage();
  }

  _navigateToHomePage() {
    context.go('/');
  }

  _onPageChanged(int index) {
    setState(() {
      _indexSelected = index;
    });
  }

  _onDotPressed(int index) {
    setState(() {
      _indexSelected = index;
    });

    _animateToPage();
  }

  _animateToPage() {
    _pageController.animateToPage(
      _indexSelected,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeIn,
    );
  }
}
