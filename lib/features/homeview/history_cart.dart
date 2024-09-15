import 'package:flutter/material.dart';
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
      historyViewModel
          .fetchHistory(widget.userId); // userId widget üzerinden alınıyor.
    });
  }

  @override
  Widget build(BuildContext context) {
    final historyDetailNavigationViewModel =
        context.read<HistoryDetailNavigationViewModel>();
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
}
