import 'package:giftbox/services/models/firestore/index.dart';
import 'package:giftbox/services/navigation/index.dart';

class HistoryDetailNavigationViewModel {
  final NavigationService _navigationService;

  HistoryDetailNavigationViewModel(this._navigationService);

  void goToHistoryDetail(HistoryModel message) {
    _navigationService.goHistoryDetail(message);
  }
}
