import 'package:flutter/material.dart';
import 'package:one_goal/presentation/screen/onboarding/models/onboarding_page_model.dart';

class OnboardingPages extends StatelessWidget {
  final List<OnboardingPageModel> pages;
  final PageController controller;
  final Function(int) onPageChanged;

  const OnboardingPages({
    super.key,
    required this.pages,
    required this.controller,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      onPageChanged: onPageChanged,
      children: pages.map((page) => buildPage(page)).toList(),
    );
  }

  Widget buildPage(OnboardingPageModel page) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          buildImage(page.image),
          const SizedBox(height: 30),
          buildTitle(page.title),
          const SizedBox(height: 10),
          buildDescription(page.description),
        ],
      ),
    );
  }

  Widget buildImage(String image) {
    return TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: 1),
            duration: Duration(seconds: 1),
            builder: (context, double value, child) {
              return Transform.scale(
                scale: value,
                child: Container(
                  width: 250,
                  height: 250,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5,
                        spreadRadius: 2,
                      )
                    ],
                    image: DecorationImage(
                      image: AssetImage(image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          );
    
  }

  Widget buildTitle(String title) {
    return Text(
      softWrap: true,
      title,
      style: TextStyle(
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w700,
        fontSize: 24,
        color: Color(0XFF000000),
        overflow: TextOverflow.ellipsis,
        ),
      textAlign: TextAlign.center,
      
    ); 
    
    
  }

  Widget buildDescription(String description) {
    return Text(
      description,
      softWrap: true,
      overflow: TextOverflow.visible,
      style: TextStyle(
      fontFamily: 'Poppins',
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Color(0XFF000000),
      overflow: TextOverflow.ellipsis,
    ),
      textAlign: TextAlign.center,
    );
  }
}
