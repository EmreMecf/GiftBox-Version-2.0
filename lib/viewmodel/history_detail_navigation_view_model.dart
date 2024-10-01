import 'package:giftbox/services/navigation/index.dart';

class HistoryDetailNavigationViewModel {
  final NavigationService _navigationService;

  HistoryDetailNavigationViewModel(this._navigationService);

  void goToHistoryDetail(String userMessage, String chatGptResponse) {
    _navigationService.goHistoryDetail(userMessage, chatGptResponse);
  }
}
