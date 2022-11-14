import 'package:flutter/cupertino.dart';

import '../../../constant/constant.dart';
import '../../../core/core.dart';
import '../../../core/services/api/authentication_api.dart';
import '../../../locator.dart';

class SigninProvider with ChangeNotifier {
  StorageService storageService = getIt<StorageService>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool btnActive = false;

  set _btnActive(bool state) {
    btnActive = state;
    notifyListeners();
  }

  login({required String emailVal, required String passwordVal}) async {
    FocusManager.instance.primaryFocus!.unfocus();
    // viewState = ViewState.busy;
    ResponseModel res = await AuthenticationApiService()
        .login(email: emailVal, password: passwordVal);
    print('emailVal: $emailVal');
    print('resssssssssssssssssssssss: ${res.message}');

    // viewState = ViewState.idle;
    if (res.success!) {
      String user = await storageService.readItem(key: individualDetails);
      UserModel currentUser = userModelFromJson(user);
      // if (!currentUser.verifiedEmail) {
      //   OtpApiService().sendOTP(email: emailVal);
      //   navigationService.navigateToReplace(AccountVerificationRoute);
      // } else if (!currentUser.active) {
      //   navigationService.navigateToReplace(PendingApprovalRoute);
      // } else {
      //   navigationService.navigateToAndRemoveUntil(HomeRoute);
      // }
      return;
    }
    // showCustomToast(res.message);
  }

  validator() {
    if (passwordController.text.isNotEmpty && emailController.text.isNotEmpty) {
      _btnActive = true;
    } else {
      _btnActive = false;
    }
  }
}
