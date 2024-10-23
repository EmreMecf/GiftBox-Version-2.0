import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../features/chatbot/index.dart';
import '../services/models/firestore/index.dart';
import '../services/models/states/category_selection_model.dart';
import '../viewmodel/index.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({Key? key}) : super(key: key);

  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  String? messageId;
  CategorySelectionModel? categorySelection;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final chatBotViewModel = context.read<ChatBotViewModel>();
      chatBotViewModel.loadMessage(); // ViewModel'den çağırıyoruz.
    });
  }

  @override
  Widget build(BuildContext context) {
    final chatBotViewModel = context.watch<ChatBotViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mesajlar'),
      ),
      body: chatBotViewModel.isLoading
          ? const Center(child: CircularProgressIndicator())
          : chatBotViewModel.messageId == null
              ? const Center(child: Text('Mesaj ID eksik.'))
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      if (chatBotViewModel.categorySelection != null)
                        SelectedCategoriesWidget(
                            categorySelection:
                                chatBotViewModel.categorySelection!),
                      FutureBuilder<HistoryModel?>(
                        future: chatBotViewModel
                            .fetchMessage(chatBotViewModel.messageId!),
                        // messageId doğrudan kullanılıyor
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasError ||
                              snapshot.data == null) {
                            return const Center(
                                child: Text("Mesaj bulunamadı."));
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
