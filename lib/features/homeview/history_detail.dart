import 'package:flutter/material.dart';
import 'package:giftbox/features/chatbot/index.dart';
import 'package:giftbox/features/messagesview/messages_list.dart';
import 'package:giftbox/services/models/firestore/index.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/index.dart';

class HistoryDetailScreen extends StatelessWidget {
  final HistoryModel message;

  const HistoryDetailScreen({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categorySelection = context.read<CategorySelectionViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mesaj Detayları'),
      ),
      body: SingleChildScrollView(
        // Kaydırılabilir alan
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SelectedCategoriesWidget(
                categorySelection:
                    categorySelection.buildCategorySelectionModel()),
            const SizedBox(height: 20),
            AiMessage(products: message.products ?? []),
          ],
        ),
      ),
    );
  }
}
