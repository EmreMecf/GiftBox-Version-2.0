import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../features/custom_app_bar.dart';
import '../features/custom_nav_bar.dart';
import '../features/messagesview/messages_list.dart';
import '../features/messagesview/send_messages_view.dart';
import '../viewmodel/send_messages.dart';

class ChatBotScreen extends StatefulWidget {
  const ChatBotScreen({super.key});

  @override
  _ChatBotScreenState createState() => _ChatBotScreenState();
}

class _ChatBotScreenState extends State<ChatBotScreen> {
  int _currentIndex = 0;

  void _onNavBarTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final chatViewModel = context.watch<SendMessagesViewModel>();

    return Scaffold(
      appBar: const CustomAppBar(),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chatViewModel.messages.length,
              itemBuilder: (context, index) {
                final message = chatViewModel.messages[index];
                if (message.role == 'user') {
                  return UserMessage(message: message.content);
                } else {
                  return AiMessage(message: message.content);
                }
              },
            ),
          ),
          const SendMessagesView(),
        ],
      ),
      bottomNavigationBar: CustomNavBar(
        currentIndex: _currentIndex,
        onNavBarTap: _onNavBarTap,
      ),
    );
  }
}
