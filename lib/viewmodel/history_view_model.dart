import 'package:flutter/material.dart';

class HistoryViewModel with ChangeNotifier {
  List<Map<String, String>> _historyItems = [
    {'date': 'Bugün', 'title': 'Chat History Item 1'},
    {'date': 'Dün', 'title': 'Chat History Item 2'},
    {'date': 'Son 7 gün', 'title': 'Chat History Item 3'},
    {'date': 'Son 30 gün', 'title': 'Chat History Item 4'},
  ];

  String _searchQuery = '';

  List<Map<String, String>> get historyItems {
    if (_searchQuery.isEmpty) {
      return _historyItems;
    } else {
      return _historyItems.where((item) {
        return item['title']!
            .toLowerCase()
            .contains(_searchQuery.toLowerCase());
      }).toList();
    }
  }

  void updateSearchQuery(String query) {
    _searchQuery = query;
    notifyListeners();
  }
}
