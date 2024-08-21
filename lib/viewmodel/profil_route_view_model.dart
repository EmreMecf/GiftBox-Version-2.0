import 'package:giftbox/services/navigation/index.dart';

class ProfileRouteViewModel {
  final NavigationService _navigationService;

  ProfileRouteViewModel(this._navigationService);

  void goToEditProfile() {
    _navigationService.goEditProfile();
  }

  void goToSettings() {
    _navigationService.goSettings();
  }
}
