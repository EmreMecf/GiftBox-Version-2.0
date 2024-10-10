import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../features/chatbot/index.dart';
import '../services/models/firestore/index.dart';
import '../viewmodel/index.dart';

class ChatBotScreen extends StatelessWidget {
  const ChatBotScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final chatBotViewModel = context.watch<ChatBotViewModel>();
    final categorySelection = context.read<CategorySelectionViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mesajlar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SelectedCategoriesWidget(
              categorySelection:
                  categorySelection.buildCategorySelectionModel(),
            ),
            StreamBuilder<HistoryModel?>(
              stream: chatBotViewModel.messageStream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError || snapshot.data == null) {
                  return const Center(child: Text("Mesaj bulunamadı."));
                }
                final message = snapshot.data!;
                return MessagesWidget(message: message);
              },
            ),
          ],
        ),
      ),
    );
  }
}
