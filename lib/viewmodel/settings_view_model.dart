import 'package:giftbox/services/navigation/index.dart';

class SettingsViewModel {
  final NavigationService _navigationService;

  SettingsViewModel(this._navigationService);

  void goToFeedback() {
    _navigationService.goFeedback();
  }

  void goToThemeSettings() {
    _navigationService.goThemeSetting();
  }
}
