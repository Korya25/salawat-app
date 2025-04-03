import 'package:flutter/material.dart';
import 'package:salawat_app/core/resources/app_constants.dart';
import 'package:salawat_app/core/resources/app_strings.dart';

class OnboardingSkipButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color color;
  final ThemeData theme;

  const OnboardingSkipButton({
    super.key,
    required this.onPressed,
    required this.color,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          AppStrings.skip,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontFamily: AppConstants.appFontFamily,
            color: color,
          ),
        ),
      ),
    );
  }
}
