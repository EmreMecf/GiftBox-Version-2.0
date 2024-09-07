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
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: ElevatedButton(
        onPressed: () async {
          final userMessage = chatBotViewModel.userMessage;
          final categorySelection =
              categorySelectionViewModel.buildCategorySelectionModel();

          await chatBotViewModel.sendMessage(userMessage, categorySelection);
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: theme.primaryColor,
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
