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
    final chatBotViewModel = context.read<ChatBotViewModel>();
    chatBotViewModel.messageStream?.then((message) {
      if (message != null) {
        setState(() {
          messageId = message.messageId;
          if (message.categorySelection != null) {
            categorySelection =
                CategorySelectionModel.fromJson(message.categorySelection!);
          }
        });
      } else {
        print('Mesaj alınamadı.');
      }
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
          : messageId == null
              ? const Center(child: Text('Mesaj ID eksik.'))
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      if (chatBotViewModel.categorySelection != null)
                        SelectedCategoriesWidget(
                            categorySelection: categorySelection!),
                      FutureBuilder<HistoryModel?>(
                        future: chatBotViewModel.fetchMessage(messageId!),
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
