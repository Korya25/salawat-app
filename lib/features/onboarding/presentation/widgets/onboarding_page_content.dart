import 'package:flutter/material.dart';
import 'package:salawat_app/core/resources/app_constants.dart';
import '../../domain/onboarding_page_model.dart';

class OnboardingPageContent extends StatelessWidget {
  final OnboardingPageModel page;
  final ThemeData theme;
  final Animation<double> animation;

  const OnboardingPageContent({
    super.key,
    required this.page,
    required this.theme,
    required this.animation,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: AppConstants.mediumSpacing),
        _buildAnimatedIcon(),
        SizedBox(height: AppConstants.largeSpacing),
        _buildAnimatedTitle(),
        SizedBox(height: AppConstants.mediumSpacing),
        _buildAnimatedSubtitle(),
        SizedBox(height: AppConstants.largeSpacing),
      ],
    );
  }

  Widget _buildAnimatedIcon() {
    return ScaleTransition(
      scale: animation,
      child: Container(
        padding: EdgeInsets.all(AppConstants.iconPadding),
        decoration: BoxDecoration(
          // ignore: deprecated_member_use
          color: page.color.withOpacity(AppConstants.gradientStartOpacity),
          shape: BoxShape.circle,
        ),
        child: Icon(page.icon, size: AppConstants.iconSize, color: page.color),
      ),
    );
  }

  Widget _buildAnimatedTitle() {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 0.3),
        end: Offset.zero,
      ).animate(animation),
      child: Text(
        page.title,
        style: theme.textTheme.headlineSmall?.copyWith(
          fontFamily: AppConstants.appFontFamily,
          fontWeight: FontWeight.bold,
          color: page.color,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _buildAnimatedSubtitle() {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0, 0.2),
        end: Offset.zero,
      ).animate(animation),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: AppConstants.subtitleHorizontalPadding,
        ),
        child: Text(
          page.subtitle,
          style: theme.textTheme.bodyLarge?.copyWith(
            fontFamily: AppConstants.appFontFamily,
            height: 1.6,
            // ignore: deprecated_member_use
            color: theme.textTheme.bodyLarge?.color?.withOpacity(
              AppConstants.textOpacity,
            ),
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
