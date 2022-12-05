import 'package:flutter/widgets.dart';

enum SettingsEnums { profile, password }

class SettingsProvider with ChangeNotifier {
  SettingsEnums _settings = SettingsEnums.profile;
  bool _hasPressed = false;

  bool get hasPressed => _hasPressed;
  SettingsEnums get settings => _settings;

  toggleDropdown() {
    _hasPressed = !_hasPressed;
    notifyListeners();
  }

  void changeSettings(SettingsEnums settings) {
    _settings = settings;
    notifyListeners();
  }
}
