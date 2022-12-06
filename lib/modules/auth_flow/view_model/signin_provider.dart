import 'dart:developer';

import 'package:buskeit/core/services/api/base.api.dart';
import 'package:buskeit/modules/dashboard/screens/dash_board.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../constant/constant.dart';
import '../../../core/core.dart';
import '../../../locator.dart';
import '../../../shared/shared.dart';

class SigninProvider with ChangeNotifier {
  StorageService storageService = getIt<StorageService>();
  HiveStorageService hiveStorageService = getIt<HiveStorageService>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  bool savePassword = false;

  void toggleSavePassword() {
    savePassword = !savePassword;
    notifyListeners();
  }

  validateSignin(context) {
    var emailRegex = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (emailController.text.isEmpty) {
      errorToast(
        context,
        message: 'please enter your email',
      );
      return false;
      // email validation regex
    } else if (!emailRegex.hasMatch(emailController.text)) {
      errorToast(
        context,
        message: 'Please enter a valid Email',
      );
      return false;
    } else if (passwordController.text.isEmpty) {
      errorToast(
        context,
        message: 'Please enter your password',
      );
      return false;
    } else {
      return true;
    }
  }

  startLoading() {
    isLoading = true;
    notifyListeners();
  }

  stopLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future login({
    required BuildContext context,
  }) async {
    startLoading();
    try {
      // ResponseModel responseModel = ResponseModel();
      await connect().post(
        "/auth/token",
        data: {
          "email": emailController.text,
          "password": passwordController.text,
        },
      ).then((value) async {
        if (value.statusCode == 200) {
          // responseModel = ResponseModel.fromJson(value.data);
          storeToken(value);
          if (savePassword) {
            hiveStorageService.storeItem(
                key: password, value: passwordController.text);
          }
          emailController.clear();
          passwordController.clear();

          successToast(context, message: 'Login Successful');

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const BaseDashBoard(),
            ),
          );
        }
      });

      stopLoading();
    } on HttpException catch (e) {
      stopLoading();
      return e.message;
    } on DioError catch (e) {
      stopLoading();
      var errorMessage =
          'We could not process your request at this time, please try again later';
      errorToast(context, message: errorMessage);
      log('e: ${e.message}');
    } catch (e) {
      stopLoading();
      print('Exception: ${e.toString()}');
    }
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
}
