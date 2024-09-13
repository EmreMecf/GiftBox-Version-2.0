import 'package:flutter/material.dart';
import 'package:giftbox/services/navigation/index.dart';

class historyDetailNavigationViewModel with ChangeNotifier {
  final NavigationService _navigationService;

  historyDetailNavigationViewModel(this._navigationService);

  void goToHistoryDetail(String userMessage, String chatGptResponse) {
    _navigationService.goHistoryDetail(userMessage, chatGptResponse);
  }
}
