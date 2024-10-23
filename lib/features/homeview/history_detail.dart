import 'package:flutter/material.dart';
import 'package:giftbox/features/chatbot/index.dart';
import 'package:giftbox/features/messagesview/messages_list.dart';
import 'package:giftbox/services/models/firestore/index.dart';
import 'package:giftbox/services/models/states/category_selection_model.dart';

class HistoryDetailScreen extends StatelessWidget {
  final HistoryModel message;

  const HistoryDetailScreen({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mesaj içindeki categorySelection'u alıyoruz
    final CategorySelectionModel? categorySelection =
        message.categorySelection != null
            ? CategorySelectionModel.fromJson(message.categorySelection!)
            : null;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mesaj Detayları'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Eğer categorySelection varsa gösteriyoruz
            if (categorySelection != null)
              SelectedCategoriesWidget(categorySelection: categorySelection),
            const SizedBox(height: 20),
            // Ürünler
            AiMessage(products: message.products ?? []),
          ],
        ),
      ),
    );
  }
}
