import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodel/index.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<OnboardingViewModel>();

    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: viewModel.pageController,
            onPageChanged: viewModel.updateIndex,
            itemCount: viewModel.images.length,
            itemBuilder: (context, index) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    viewModel.images[index],
                    height: 300,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Onboarding Slide ${index + 1}',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Açıklama metni burada yer alacak.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              );
            },
          ),
          Positioned(
            top: 40,
            right: 20,
            child: Visibility(
              visible: viewModel.currentIndex != viewModel.images.length - 1,
              child: TextButton(
                onPressed: () => viewModel.navigateToLogin(context),
                child: const Text(
                  'Skip',
                  style: TextStyle(color: Colors.blue, fontSize: 16),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    viewModel.images.length,
                    (index) => Container(
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: viewModel.currentIndex == index
                            ? Colors.blue
                            : Colors.grey,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                viewModel.currentIndex == viewModel.images.length - 1
                    ? ElevatedButton(
                        onPressed: () => viewModel.navigateToLogin(context),
                        child: const Text('Get Started'),
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: viewModel.goToPreviousPage,
                            icon: const Icon(Icons.arrow_back),
                          ),
                          IconButton(
                            onPressed: viewModel.goToNextPage,
                            icon: const Icon(Icons.arrow_forward),
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
