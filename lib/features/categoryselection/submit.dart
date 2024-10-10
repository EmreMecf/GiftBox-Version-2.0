import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/index.dart';

class SubmitChatGpt extends StatelessWidget {
  const SubmitChatGpt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chatBotViewModel = context.watch<ChatBotViewModel>();
    final categorySelectionViewModel =
        context.watch<CategorySelectionViewModel>();
    final categoryRouteViewModel = context.read<CategoryRouteViewModel>();
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () async {
          final categorySelection =
              categorySelectionViewModel.buildCategorySelectionModel();

          await chatBotViewModel.sendMessage(categorySelection);
          categoryRouteViewModel.goToChatBot();
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: theme.colorScheme.primary,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text('Gönder', style: TextStyle(fontSize: 18)),
      ),
    );
  }
}
