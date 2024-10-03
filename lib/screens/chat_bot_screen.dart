import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:giftbox/services/models/states/category_selection_model.dart';
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
  final PanelController _panelController = PanelController();
  Stream<HistoryModel?>? lastHistoryStream;
  late CategorySelectionModel categorySelection;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Son mesaj akışını çekme işlemi, henüz yapılmadıysa başlatılır
    lastHistoryStream ??= context.read<ChatBotViewModel>().fetchLastMessage();
  }

  @override
  Widget build(BuildContext context) {
    final chatBotViewModel = context.watch<ChatBotViewModel>();
    final panelHeightOpen = MediaQuery.of(context).size.height * 0.8;
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.08;

    return Scaffold(
      appBar: AppBar(
        title:
            Text(AppLocalizations.of(context)!.chat_bot_screen_app_bar_label),
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
        body: lastHistoryStream == null
            ? const Center(child: CircularProgressIndicator())
            : StreamBuilder<HistoryModel?>(
                stream: lastHistoryStream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError || snapshot.data == null) {
                    // Eğer hata varsa ya da son mesaj boşsa kullanıcıya bir mesaj göster
                    return const Text("Son mesaj bulunamadı.");
                  } else if (!snapshot.hasData) {
                    return const Center(child: Text("Hiç mesaj yok."));
                  }
                  final message = snapshot.data!;
                  final products = chatBotViewModel.productsList;

                  return SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(
                          bottom: 175, top: 8.0, left: 12.0, right: 12.0),
                      child: Column(
                        crossAxisAlignment:
                            message.userId == chatBotViewModel.userId
                                ? CrossAxisAlignment.end
                                : CrossAxisAlignment.start,
                        children: [
                          UserMessage(message: message.defaultUserMessage),
                          if (message.chatGptResponse.isNotEmpty &&
                              products.isNotEmpty) ...[
                            AiMessage(
                              products: products,
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
