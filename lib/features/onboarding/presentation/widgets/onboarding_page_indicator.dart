import 'package:flutter/material.dart';
import 'package:salawat_app/core/resources/app_colors.dart';
import 'package:salawat_app/core/resources/app_constants.dart';

class OnboardingPageIndicator extends StatelessWidget {
  final int currentPage;
  final int pageCount;
  final Color activeColor;

  const OnboardingPageIndicator({
    super.key,
    required this.currentPage,
    required this.pageCount,
    required this.activeColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: AppConstants.verticalPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          pageCount,
          (index) => AnimatedContainer(
            duration: AppConstants.buttonAnimationDuration,
            margin: EdgeInsets.symmetric(
              horizontal: AppConstants.smallSpacing / 2,
            ),
            width:
                currentPage == index
                    ? AppConstants.activePageIndicatorWidth
                    : AppConstants.pageIndicatorSize,
            height: AppConstants.pageIndicatorSize,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                AppConstants.pageIndicatorBorderRadius,
              ),
              color:
                  currentPage == index
                      ? activeColor
                      // ignore: deprecated_member_use
                      : AppColors.grey.withOpacity(
                        AppConstants.inactiveIndicatorOpacity,
                      ),
            ),
          ),
        ),
      ),
    );
  }
}
