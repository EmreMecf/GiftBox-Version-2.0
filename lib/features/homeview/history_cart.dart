import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:giftbox/features/homeview/rename_dialog.dart';
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
    final theme = Theme.of(context); // Temayı al

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
              elevation: 4,
              color: theme.colorScheme.surface,
              child: ListTile(
                title: Text(
                  message.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: theme.textTheme.bodyLarge?.color,
                  ),
                ),
                trailing: PopupMenuButton<String>(
                  onSelected: (value) async {
                    if (value == 'rename') {
                      // Yeniden adlandırma işlemi için dialog göster
                      showDialog(
                        context: context,
                        builder: (context) => RenameDialog(
                          messageId: message.messageId!,
                          currentTitle: message.title,
                        ),
                      );
                    } else if (value == 'delete') {
                      // Silme işlemi
                      await historyDeleteViewModel.deleteMessage(
                          context, message.messageId!);
                    }
                  },
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem<String>(
                        value: 'rename',
                        child: Text(AppLocalizations.of(context)!
                            .history_cart_rename_label),
                      ),
                      PopupMenuItem<String>(
                        value: 'delete',
                        child: Text(AppLocalizations.of(context)!
                            .history_cart_delete_label),
                      ),
                    ];
                  },
                ),
                onTap: () {
                  historyDetailNavigationViewModel.goToHistoryDetail(
                      message.defaultUserMessage, message.chatGptResponse);
                },
              ),
            );
          },
        );
      },
    );
  }
}
