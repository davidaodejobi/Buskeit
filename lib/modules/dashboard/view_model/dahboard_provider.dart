import 'package:flutter/cupertino.dart';

class DashboardProvider with ChangeNotifier {
  bool _hasWorkSpace = false;
  bool get hasWorkSpace => _hasWorkSpace;

  void setHasWorkSpace() {
    _hasWorkSpace = !_hasWorkSpace;
    notifyListeners();
  }
}
