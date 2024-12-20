import 'package:flutter/material.dart';

import '../../services/models/firestore/index.dart';
import '../messagesview/messages_list.dart';

class MessagesWidget extends StatelessWidget {
  final HistoryModel message;

  const MessagesWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (message.chatGptResponse.isNotEmpty)
          AiMessage(products: message.products ?? []),
      ],
    );
  }
}
