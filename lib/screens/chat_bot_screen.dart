import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:url_launcher/url_launcher.dart';

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

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (lastHistoryStream == null) {
      lastHistoryStream = context.read<ChatBotViewModel>().fetchLastMessage();
    }
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  String buildGoogleShoppingUrl(String productName) {
    final encodedProductName = Uri.encodeComponent(productName);
    return 'https://www.google.com/search?tbm=shop&q=$encodedProductName';
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
                        if (message.chatGptResponse.isNotEmpty) ...[
                          AiMessage(message: message.chatGptResponse),
                          TextButton(
                            onPressed: () {
                              final googleShoppingUrl =
                                  buildGoogleShoppingUrl(message.userMessage);
                              _launchURL(googleShoppingUrl);
                            },
                            child: Text("Google Shopping'de Ara"),
                          ),
                        ],
                      ],
                    ),
                  );
                },
              ),
      ),
    );
  }
}
