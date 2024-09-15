import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../features/messagesview/messages_list.dart';
import '../services/models/firestore/history_model.dart';
import '../viewmodel/index.dart';
import 'category_selection_screen.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final ScrollController _scrollController = ScrollController();
  final PanelController _panelController = PanelController();

  @override
  Widget build(BuildContext context) {
    final chatBotViewModel = context.watch<ChatBotViewModel>();
    final panelHeightOpen = MediaQuery.of(context).size.height * 0.8;
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.08;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hediyeni Bul"),
      ),
      body: SlidingUpPanel(
        controller: _panelController,
        maxHeight: panelHeightOpen,
        minHeight: panelHeightClosed,
        parallaxEnabled: true,
        parallaxOffset: 0.5,
        panelBuilder: (controller) => CustomSlidingUpPanel(
          controller: controller,
          panelController: _panelController,
        ),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(24.0),
        ),
        body: StreamBuilder<List<HistoryModel>>(
          stream: chatBotViewModel.fetchHistoryStream(),
          // Firestore'dan gelen Stream
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return const Center(child: Text("Bir hata oluştu."));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text("Hiç mesaj yok."));
            }

            final messages = snapshot.data!;

            return ListView.builder(
              controller: _scrollController,
              itemCount: messages.length,
              itemBuilder: (context, index) {
                final message = messages[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 12.0),
                  child: Column(
                    crossAxisAlignment:
                        message.userId == chatBotViewModel.userId
                            ? CrossAxisAlignment.end
                            : CrossAxisAlignment.start,
                    children: [
                      if (message.userMessage.isNotEmpty)
                        UserMessage(message: message.userMessage),
                      if (message.chatGptResponse.isNotEmpty)
                        AiMessage(message: message.chatGptResponse),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
