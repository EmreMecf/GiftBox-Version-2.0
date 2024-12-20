import 'package:giftbox/services/navigation/index.dart';

class CategoryRouteViewModel {
  final NavigationService _navigationService;

  CategoryRouteViewModel(this._navigationService);

  void goToChatBot() {
    _navigationService.goChatBot();
  }
}
