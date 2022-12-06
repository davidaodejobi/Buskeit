import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

import '../../../core/core.dart';
import '../../../core/services/api/base.api.dart';
import '../../../locator.dart';
import '../../../shared/shared.dart';

enum SettingsEnums { profile, password }

class SettingsProvider with ChangeNotifier {
  HiveStorageService hiveStorageService = getIt<HiveStorageService>();
  final oldController = TextEditingController();
  final newController = TextEditingController();
  final newConController = TextEditingController();
  bool isLoading = false;
  SettingsEnums _settings = SettingsEnums.password;
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

  startLoading() {
    isLoading = true;
    notifyListeners();
  }

  stopLoading() {
    isLoading = false;
    notifyListeners();
  }

  clear() {
    oldController.clear();
    newController.clear();
    newConController.clear();
  }

  validateChange(context) {
    if (oldController.text.isEmpty &&
        newController.text.isEmpty &&
        newConController.text.isEmpty) {
      errorToast(
        context,
        message: 'All fields are required',
      );
      return false;
      // email validation regex
    } else if (newConController.text != newController.text) {
      errorToast(
        context,
        message: 'New passwords do not match',
      );
      return false;
    } else {
      return true;
    }
  }

  Future changePassword({
    required BuildContext context,
  }) async {
    startLoading();
    try {
      await connect().post("/auth/password/change", data: {
        "old_password": oldController.text,
        "password1": newConController.text,
        "password2": newConController.text,
      }).then(
        (value) {
          if (value.statusCode == 200) {
            successToast(
              context,
              message: 'Password changed successfully',
            );
            clear();
            stopLoading();
          }
        },
      );
      stopLoading();
      return true;
    } on DioError {
      stopLoading();
      var errorMessage =
          'We could not process your request at this time, please try again later';
      errorToast(
        context,
        message: errorMessage,
      );
      return false;
    }
  }
}
