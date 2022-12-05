import 'package:flutter/cupertino.dart';

class BaseDashboardProvider with ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  bool _hasWorkSpace = false;
  bool get hasWorkSpace => _hasWorkSpace;

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void setHasWorkSpace() {
    _hasWorkSpace = !_hasWorkSpace;
    notifyListeners();
  }
}
