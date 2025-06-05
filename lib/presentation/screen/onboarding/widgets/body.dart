import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:one_goal/presentation/screen/onboarding/models/onboarding_page_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import 'onboarding_controls.dart';
import 'onboarding_dots.dart';
import 'onboarding_pages.dart';



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
        final List<OnboardingPageModel> onboardingPages = [
            OnboardingPageModel(
                title: AppLocalizations.of(context)!.on_board_greeting_title_1,
                description: AppLocalizations.of(context)!.on_board_greeting_desc_1,
                image: 'assets/images/onboarding/onboarding45.png',
            ),
            OnboardingPageModel(
                title: AppLocalizations.of(context)!.on_board_greeting_title_2,
                description: AppLocalizations.of(context)!.on_board_greeting_desc_2,
                image: 'assets/images/onboarding/onboarding1.png',
            ),
            OnboardingPageModel(
                title: AppLocalizations.of(context)!.on_board_greeting_title_3,
                description: AppLocalizations.of(context)!.on_board_greeting_desc_3,
                image: 'assets/images/onboarding/onboarding21.png',
            ),
        ];

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

        if (_indexSelected != 3) {
        _animateToPage();
        return;
        }

        _navigateToHomePage();
    }

    _navigateToHomePage() {
        context.go('/SignUp');
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
