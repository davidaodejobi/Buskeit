import 'package:flutter/material.dart';

class BusMgmtProvider with ChangeNotifier {
  bool _location = false;
  bool get location => _location;

  toggleLocation() {
    _location = !_location;
    notifyListeners();
  }
}
