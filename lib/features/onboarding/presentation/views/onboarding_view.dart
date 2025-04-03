// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:salawat_app/core/resources/app_constants.dart';
import 'package:salawat_app/core/resources/app_routes.dart';
import 'package:salawat_app/features/onboarding/presentation/widgets/onboarding_navigation_button.dart';
import 'package:salawat_app/features/onboarding/presentation/widgets/onboarding_page_content.dart';
import 'package:salawat_app/features/onboarding/presentation/widgets/onboarding_page_indicator.dart';
import 'package:salawat_app/features/onboarding/presentation/widgets/onboarding_skip_button.dart';

import '../../domain/onboarding_page_model.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView>
    with SingleTickerProviderStateMixin {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _initializeAnimations();
  }

  void _initializeAnimations() {
    _animationController = AnimationController(
      vsync: this,
      duration: AppConstants.fadeAnimationDuration,
    );
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final currentPageColor = OnboardingPageModel.pages[_currentPage].color;
    final isLastPage = _currentPage == OnboardingPageModel.pages.length - 1;

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              // ignore: deprecated_member_use
              currentPageColor.withOpacity(AppConstants.gradientStartOpacity),
              theme.colorScheme.surface,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              OnboardingSkipButton(
                onPressed: _goToHome,
                color: currentPageColor,
                theme: theme,
              ),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: OnboardingPageModel.pages.length,
                  onPageChanged: _onPageChanged,
                  itemBuilder: (context, index) {
                    return SingleChildScrollView(
                      padding: EdgeInsets.symmetric(
                        horizontal: AppConstants.horizontalPadding,
                      ),
                      child: FadeTransition(
                        opacity: _fadeAnimation,
                        child: OnboardingPageContent(
                          page: OnboardingPageModel.pages[index],
                          theme: theme,
                          animation: _fadeAnimation,
                        ),
                      ),
                    );
                  },
                ),
              ),
              OnboardingPageIndicator(
                currentPage: _currentPage,
                pageCount: OnboardingPageModel.pages.length,
                activeColor: currentPageColor,
              ),
              OnboardingNavigationButton(
                isLastPage: isLastPage,
                color: currentPageColor,
                theme: theme,
                onPressed: isLastPage ? _goToHome : _nextPage,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
      _animationController.reset();
      _animationController.forward();
    });
  }

  void _nextPage() {
    _pageController.nextPage(
      duration: AppConstants.pageTransitionDuration,
      curve: Curves.easeInOut,
    );
  }

  void _goToHome() {
    context.goNamed(AppRoutes.homeViewRoute);
  }
}
