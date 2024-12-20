import 'package:flutter/material.dart';

import '../services/navigation/index.dart';

class OnboardingViewModel extends ChangeNotifier {
  final NavigationService _navigationService;

  OnboardingViewModel(this._navigationService);

  final PageController pageController = PageController();
  int currentIndex = 0;

  final List<String> images = [
    'lib/assets/onboarding1.png',
    'lib/assets/onboarding2.png',
    'lib/assets/onboarding3.png',
  ];

  void updateIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void navigateToLogin(BuildContext context) {}

  void goToNextPage() {
    if (currentIndex < images.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  void goToPreviousPage() {
    if (currentIndex > 0) {
      pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }
}
