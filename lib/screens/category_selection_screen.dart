import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../features/categoryselection/index.dart';
import '../viewmodel/index.dart';

class CustomSlidingUpPanel extends StatelessWidget {
  final ScrollController controller;
  final PanelController panelController;

  const CustomSlidingUpPanel({
    Key? key,
    required this.controller,
    required this.panelController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<CategorySelectionViewModel>(context);

    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
      controller: controller,
      children: [
        const SizedBox(height: 2),
        buildDragHandle(),
        const SizedBox(height: 12),
        BudgetSection(
          minBudget: viewModel.minBudget,
          maxBudget: viewModel.maxBudget,
          onMinBudgetChanged: (value) {
            viewModel.minBudget = value;
          },
          onMaxBudgetChanged: (value) {
            viewModel.maxBudget = value;
          },
        ),
        const SizedBox(height: 20),
        AgeSection(
          age: viewModel.age,
          onChanged: (value) {
            viewModel.age = value;
          },
        ),
        const SizedBox(height: 20),
        GenderSection(
          gender: viewModel.gender,
          onChanged: (value) {
            viewModel.gender = value!;
          },
        ),
        const SizedBox(height: 20),
        SpecialDaysSection(
          specialDay: viewModel.specialDay,
          onChanged: (value) {
            viewModel.specialDay = value;
          },
        ),
        const SizedBox(height: 20),
        InterestsSection(
          selectedCategory: viewModel.selectedCategory,
          selectedInterests: viewModel.selectedInterests,
          onCategoryChanged: (category) {
            viewModel.selectedCategory = category;
          },
          onInterestToggled: (interest) {
            viewModel.toggleInterest(interest);
          },
        ),
        const SizedBox(height: 20),
        const SubmitChatGpt(),
        const SizedBox(height: 15),
      ],
    );
  }

  Widget buildDragHandle() => GestureDetector(
        child: Center(
          child: Container(
            width: 30,
            height: 5,
            decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(12)),
          ),
        ),
      );
}
