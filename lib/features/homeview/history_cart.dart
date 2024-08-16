import 'package:flutter/material.dart';
import 'package:giftbox/viewmodel/index.dart';
import 'package:provider/provider.dart';

class HistoryCart extends StatelessWidget {
  const HistoryCart({super.key});

  @override
  Widget build(BuildContext context) {
    final historyItems = Provider.of<HistoryViewModel>(context).historyItems;
    Map<String, List<Map<String, String>>> categorizedHistory = {
      'Bugün': [],
      'Dün': [],
      'Son 7 gün': [],
      'Son 30 gün': []
    };

    historyItems.forEach((item) {
      categorizedHistory[item['date']]!.add(item);
    });

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHistorySection('Bugün', categorizedHistory['Bugün']!),
          _buildHistorySection('Dün', categorizedHistory['Dün']!),
          _buildHistorySection('Son 7 gün', categorizedHistory['Son 7 gün']!),
          _buildHistorySection('Son 30 gün', categorizedHistory['Son 30 gün']!),
        ],
      ),
    );
  }

  Widget _buildHistorySection(String title, List<Map<String, String>> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          ...items.map((item) {
            return Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: ListTile(
                title: Text(item['title']!),
                trailing: const Icon(Icons.more_vert),
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
