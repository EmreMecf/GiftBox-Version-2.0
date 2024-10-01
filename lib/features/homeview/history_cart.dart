import 'package:flutter/material.dart';
import 'package:giftbox/services/repositories/firebase_firestore_repository.dart';
import 'package:giftbox/viewmodel/history_delete_view_model.dart';
import 'package:giftbox/viewmodel/history_detail_navigation_view_model.dart';
import 'package:giftbox/viewmodel/history_view_model.dart';
import 'package:provider/provider.dart';

class HistoryCard extends StatefulWidget {
  final String userId; // Kullanıcının ID'si bu widget'a geçilecek.

  const HistoryCard({Key? key, required this.userId}) : super(key: key);

  @override
  _HistoryCardState createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  @override
  void initState() {
    super.initState();

    // Firestore'dan verileri almak için kullanıcı ID'si ile fetchHistory çağrısı yapılır.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final historyViewModel = context.read<HistoryViewModel>();
      historyViewModel.fetchHistory(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final historyDetailNavigationViewModel =
        context.read<HistoryDetailNavigationViewModel>();
    final historyDeleteViewModel = context.read<HistoryDeleteViewModel>();

    return Consumer<HistoryViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (viewModel.historyList.isEmpty) {
          return const Center(child: Text('Henüz mesaj geçmişiniz yok.'));
        }

        return ListView.builder(
          padding: const EdgeInsets.all(8.0),
          itemCount: viewModel.historyList.length,
          itemBuilder: (context, index) {
            final message = viewModel.historyList[index];

            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 2,
              child: ListTile(
                title: Text(
                  message.title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                trailing: PopupMenuButton<String>(
                  onSelected: (value) async {
                    if (value == 'rename') {
                      // Yeniden adlandırma işlemi
                      await _showRenameDialog(context, message.messageId!);
                    } else if (value == 'delete') {
                      // Silme işlemi
                      await historyDeleteViewModel.deleteMessage(
                          context, message.messageId!);
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      const PopupMenuItem<String>(
                        value: 'rename',
                        child: Text('Yeniden Adlandır'),
                      ),
                      const PopupMenuItem<String>(
                        value: 'delete',
                        child: Text('Sil'),
                      ),
                    ];
                  },
                ),
                onTap: () {
                  historyDetailNavigationViewModel.goToHistoryDetail(
                      message.userMessage, message.chatGptResponse);
                },
              ),
            );
          },
        );
      },
    );
  }

  // Yeniden adlandırma için kullanıcıya bir dialog gösteriyoruz
  Future<void> _showRenameDialog(BuildContext context, String messageId) async {
    final TextEditingController _controller = TextEditingController();
    final firebaseFirestoreRepository =
        context.read<FirebaseFirestoreRepository>();

    return showDialog<void>(
      context: context,
      barrierDismissible: false, // Kullanıcı diyaloğu kapatmak zorunda
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Mesajı Yeniden Adlandır'),
          content: TextField(
            controller: _controller,
            decoration: const InputDecoration(hintText: 'Yeni başlık girin'),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('İptal'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Kaydet'),
              onPressed: () async {
                final newTitle = _controller.text;
                if (newTitle.isNotEmpty) {
                  await firebaseFirestoreRepository.updateMessageTitle(
                      messageId, newTitle);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
