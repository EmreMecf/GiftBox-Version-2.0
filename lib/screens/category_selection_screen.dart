import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/index.dart';
import '../features/categoryselection/index.dart';

class CategorySelectionScreen extends StatefulWidget {
  const CategorySelectionScreen({Key? key}) : super(key: key);

  @override
  _CategorySelectionScreenState createState() =>
      _CategorySelectionScreenState();
}

class _CategorySelectionScreenState extends State<CategorySelectionScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final categorySelection = context.read<CategorySelectionViewModel>();
      categorySelection.resetSelection();
    });
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<CategorySelectionViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Kategori Seçimi'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BudgetSection(
              minBudget: viewModel.minBudget,
              maxBudget: viewModel.maxBudget,
              onMinBudgetChanged: (value) {
                setState(() {
                  viewModel.minBudget = value;
                });
              },
              onMaxBudgetChanged: (value) {
                setState(() {
                  viewModel.maxBudget = value;
                });
              },
            ),
            const SizedBox(height: 20),
            AgeSection(
              age: viewModel.age,
              onChanged: (value) {
                setState(() {
                  viewModel.age = value;
                });
              },
            ),
            const SizedBox(height: 20),
            GenderSection(
              gender: viewModel.gender,
              onChanged: (value) {
                setState(() {
                  viewModel.gender = value!;
                });
              },
            ),
            const SizedBox(height: 20),
            SpecialDaysSection(
              specialDay: viewModel.specialDay,
              onChanged: (value) {
                setState(() {
                  viewModel.specialDay = value;
                });
              },
            ),
            const SizedBox(height: 20),
            InterestsSection(
              selectedCategory: viewModel.selectedCategory,
              selectedInterests: viewModel.selectedInterests,
              onCategoryChanged: (category) {
                setState(() {
                  viewModel.selectedCategory = category;
                });
              },
              onInterestToggled: (interest) {
                setState(() {
                  viewModel.toggleInterest(interest);
                });
              },
            ),
            const SizedBox(height: 20),
            const SubmitChatGpt(),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }
}
