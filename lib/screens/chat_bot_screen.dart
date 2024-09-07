import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../features/messagesview/messages_list.dart';
import '../viewmodel/index.dart';
import 'category_selection_screen.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final chatBotViewModel = context.watch<ChatBotViewModel>();
    final panelController = PanelController();
    final panelHeightOpen = MediaQuery.of(context).size.height * 0.8;
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.08;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Hediyeni Bul"),
      ),
      body: SlidingUpPanel(
        controller: panelController,
        maxHeight: panelHeightOpen,
        minHeight: panelHeightClosed,
        parallaxEnabled: true,
        parallaxOffset: 0.5,
        panelBuilder: (controller) => CustomSlidingUpPanel(
          controller: controller,
          panelController: panelController,
        ),
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(24.0),
        ),
        body: buildMessagesList(chatBotViewModel),
      ),
    );
  }

  Widget buildMessagesList(ChatBotViewModel chatBotViewModel) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: _scrollController, // ScrollController ekledik
            itemCount: chatBotViewModel.messages.length,
            itemBuilder: (context, index) {
              final message = chatBotViewModel.messages[index];
              return message.role == 'user'
                  ? UserMessage(message: message.content)
                  : AiMessage(message: message.content);
            },
          ),
        ),
      ],
    );
  }
}
