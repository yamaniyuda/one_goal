import 'package:flutter/material.dart';

class OnboardingPageModel {
  final List<OnboardingPageTitle> title;
  final String description;
  final String image;

  OnboardingPageModel({
    required this.title,
    required this.description,
    required this.image,
  });
}

class OnboardingPageTitle {
  final String text;
  final Color color;

  OnboardingPageTitle({
    required this.text,
    required this.color,
  });
}