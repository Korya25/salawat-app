import 'package:flutter/material.dart';
import 'package:salawat_app/core/resources/app_colors.dart';
import 'package:salawat_app/core/resources/app_strings.dart';

class OnboardingPageModel {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;

  OnboardingPageModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  static List<OnboardingPageModel> get pages => [
    OnboardingPageModel(
      title: AppStrings.onboardingTitles[0],
      subtitle: AppStrings.onboardingSubtitles[0],
      icon: Icons.notifications_active,
      color: AppColors.page1Color,
    ),
    OnboardingPageModel(
      title: AppStrings.onboardingTitles[1],
      subtitle: AppStrings.onboardingSubtitles[1],
      icon: Icons.volume_up,
      color: AppColors.page2Color,
    ),
    OnboardingPageModel(
      title: AppStrings.onboardingTitles[2],
      subtitle: AppStrings.onboardingSubtitles[2],
      icon: Icons.insights,
      color: AppColors.page3Color,
    ),
  ];
}
