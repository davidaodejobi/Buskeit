import 'package:flutter/material.dart';

import '../../../constant/constant.dart';
import '../../../core/core.dart';
import '../../../locator.dart';
import '../../auth_flow/screens/sign_in.dart';

class BaseDashboardProvider with ChangeNotifier {
  StorageService storageService = getIt<StorageService>();

  logout(BuildContext context) {
    storageService.deleteItem(key: token);
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const SignIn()));
    notifyListeners();
  }

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;
  bool _hasWorkSpace = false;
  bool get hasWorkSpace => _hasWorkSpace;
  bool _dashboard = true;
  bool get dashboard => _dashboard;

  toggleDashboard() {
    _dashboard = !_dashboard;
    notifyListeners();
  }

  void setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  void setHasWorkSpace() {
    _hasWorkSpace = !_hasWorkSpace;
    notifyListeners();
  }
}
