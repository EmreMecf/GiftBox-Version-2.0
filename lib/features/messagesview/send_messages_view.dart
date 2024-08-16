import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../viewmodel/send_messages.dart';

class SendMessagesView extends StatelessWidget {
  const SendMessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    final chatViewModel = Provider.of<SendMessagesViewModel>(context);
    final TextEditingController controller = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Buraya Yaz',
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () async {
              final message = controller.text.trim();
              if (message.isNotEmpty) {
                await chatViewModel.sendMessage(message);
                controller.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
