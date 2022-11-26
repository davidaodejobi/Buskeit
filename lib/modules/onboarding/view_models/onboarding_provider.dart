import 'package:buskeit/core/services/hive_storage_service.dart';
import 'package:buskeit/modules/auth_flow/screens/sign_up.dart';
import 'package:flutter/material.dart';

import '../../../constant/constant.dart';
import '../../../locator.dart';

class OnBoardingProvider with ChangeNotifier {
  //check if user has seen onboarding page
  final HiveStorageService _storageService = getIt<HiveStorageService>();
  bool _hasSeenOnboarding = false;
  bool get hasSeenOnboarding => _hasSeenOnboarding;

  void setHasSeenOnboarding(BuildContext context) {
    _hasSeenOnboarding = true;
    _storageService.storeItem(key: onBoarded, value: _hasSeenOnboarding);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const SignUp(),
      ),
    );

    notifyListeners();
  }
}
