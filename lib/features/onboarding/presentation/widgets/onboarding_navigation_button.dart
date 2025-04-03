import 'package:flutter/material.dart';
import 'package:salawat_app/core/resources/app_colors.dart';
import 'package:salawat_app/core/resources/app_constants.dart';
import 'package:salawat_app/core/resources/app_strings.dart';

class OnboardingNavigationButton extends StatelessWidget {
  final bool isLastPage;
  final Color color;
  final ThemeData theme;
  final VoidCallback onPressed;

  const OnboardingNavigationButton({
    super.key,
    required this.isLastPage,
    required this.color,
    required this.theme,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppConstants.horizontalPadding,
        vertical: AppConstants.verticalPadding,
      ),
      child: AnimatedContainer(
        duration: AppConstants.buttonAnimationDuration,
        height: AppConstants.buttonHeight,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            minimumSize: const Size(double.infinity, AppConstants.buttonHeight),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(
                AppConstants.buttonBorderRadius,
              ),
            ),
            elevation: 4,
            // ignore: deprecated_member_use
            shadowColor: color.withOpacity(AppConstants.shadowOpacity),
          ),
          onPressed: onPressed,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isLastPage ? AppStrings.startNow : AppStrings.next,
                style: theme.textTheme.bodyLarge?.copyWith(
                  fontFamily: AppConstants.appFontFamily,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              if (!isLastPage) ...[
                SizedBox(width: AppConstants.smallSpacing),
                const Icon(Icons.arrow_forward, color: AppColors.white),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
