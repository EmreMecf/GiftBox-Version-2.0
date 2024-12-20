import 'package:giftbox/services/navigation/index.dart';

class NavBarRoute {
  final NavigationService _navigationService;

  NavBarRoute(this._navigationService);

  void goToCalendar() {
    _navigationService.goCalendar();
  }

  void goToHome() {
    _navigationService.goHome();
  }

  void goToCategory() {
    _navigationService.goCategory();
  }
}
