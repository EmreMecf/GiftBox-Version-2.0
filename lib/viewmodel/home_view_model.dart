import 'package:giftbox/services/navigation/index.dart';

class HomeViewModel {
  final NavigationService _navigationService;

  HomeViewModel(this._navigationService);

  void goToProfile() {
    _navigationService.goProfile();
  }

  void goToCategory() {
    _navigationService.goCategory();
  }
}
