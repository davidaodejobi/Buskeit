import 'dart:developer';

import 'package:buskeit/modules/dashboard_flow/screens/flow_selection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../constant/constant.dart';
import '../../../core/core.dart';
import '../../../locator.dart';

class SigninProvider with ChangeNotifier {
  StorageService storageService = getIt<StorageService>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;

  startLoading() {
    isLoading = true;
    notifyListeners();
  }

  stopLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    startLoading();
    try {
      ResponseModel responseModel = ResponseModel();
      await connect().post("/auth/token", data: {
        "email": email,
        "password": password,
      }).then((value) async {
        storeToken(value);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const FlowSelection(),
          ),
        );
        // Response response = await connect().get("/user/me");
        // if (response.statusCode == 200) {
        //   storeUserDetails(response);
        // }
      });

      stopLoading();
      // await futureAwait();
      // print('responseModel: ${responseModel.message}');
      return responseModel;
    } on DioError catch (e) {
      stopLoading();
      var errorMessage =
          'We could not process your request at this time, please try again later';
      showAlertDialog(context: context, message: errorMessage);
      log('e: ${e.message}');
      return errorModelFromJson(e.response!.data);
    }
  }

  showAlertDialog({required BuildContext context, required String message}) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Lottie.asset(
          'assets/animations/error-purple.json',
          height: 100,
          width: 100,
        ),
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline5,
        ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Ok',
                style: Theme.of(context).textTheme.headline5,
              )),
        ],
      ),
    );
  }

  storeToken(response) {
    ResponseModel res = responseModelFromJson(response.data);
    String myToken = res.tokens!.access;

    storageService.storeItem(key: token, value: myToken);
    // read token from storage
    storageService.readItem(key: token).then((value) {});
  }

  removeToken() {
    storageService.deleteItem(key: token);
  }

  storeUserDetails(response) {
    ResponseModel res = responseModelFromJson(response.data);
    UserModel user = UserModel.fromJson(res.user);

    // userService.credentials = user;
    storageService.storeItem(
        key: individualDetails, value: userModelToJson(user));
  }
}

  // bool btnActive = false;
  // set _btnActive(bool state) {
  //   btnActive = state;
  //   notifyListeners();
  // }

  
  // validator() {
  //   if (passwordController.text.isNotEmpty && emailController.text.isNotEmpty) {
  //     _btnActive = true;
  //   } else {
  //     _btnActive = false;
  //   }
  // }