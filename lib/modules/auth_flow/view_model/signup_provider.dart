import 'dart:developer';

import 'package:buskeit/core/services/api/base.api.dart';
import 'package:buskeit/modules/auth_flow/screens/user_details.dart';
import 'package:buskeit/modules/dashboard/screens/dash_board.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../constant/constant.dart';
import '../../../core/core.dart';
import '../../../locator.dart';
import '../../../shared/shared.dart';

class SignupProvider with ChangeNotifier {
  StorageService storageService = getIt<StorageService>();
  HiveStorageService hiveStorageService = HiveStorageService();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordCController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  String selectedGender = "Select Gender";
  List<String> genderOptions = [
    "Select Gender",
    "Male",
    "Female",
  ];

  bool savePassword = false;
  void toggleSavePassword() {
    savePassword = !savePassword;
    notifyListeners();
  }

  onGenderSelect(String gender) {
    selectedGender = gender;
    notifyListeners();
  }

  bool validateUserDetails(BuildContext context) {
    if (firstNameController.text.isEmpty) {
      errorToast(
        context,
        message: 'First Name is required',
      );
      return false;
    }
    if (lastNameController.text.isEmpty) {
      errorToast(context, message: 'Last Name is required');
      return false;
    }
    if (selectedGender == "Select Gender") {
      errorToast(
        context,
        message: 'Please select a gender',
      );
      return false;
    }
    if (phoneNumberController.text.isEmpty) {
      errorToast(
        context,
        message: 'Phone Number is required',
      );
      return false;
    }
    return true;
  }

  bool isLoading = false;

  validateSignup(context) {
    var emailRegex = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (emailController.text.isEmpty) {
      errorToast(
        context,
        message: 'Email is required',
      );
      return false;
      // email validation regex
    } else if (!emailRegex.hasMatch(emailController.text)) {
      errorToast(
        context,
        message: 'Please enter a valid Email',
      );
      return false;
    } else if (passwordController.text == passwordCController.text &&
        passwordController.text.isNotEmpty) {
      return true;
    } else {
      errorToast(
        context,
        message: "Password and Confirm Password must be same and not empty",
      );
      return false;
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

  signupMock() {
    startLoading();
    Future.delayed(const Duration(seconds: 3), () {
      stopLoading();
    });

    notifyListeners();
  }

  Future signup({
    required BuildContext context,
  }) async {
    startLoading();
    try {
      // ResponseModel responseModel = ResponseModel();
      await connect().post("/auth/register", data: {
        "email": emailController.text,
        "password1": passwordController.text,
        "password2": passwordCController.text,
      }).then((value) {
        if (savePassword) {
          hiveStorageService.storeItem(
              key: password, value: passwordController.text);

          successToast(context,
              message: 'Account created successfully, please ver');
        }
      });
      stopLoading();
      return true;
    } on DioError {
      stopLoading();
      var errorMessage =
          'We could not process your request at this time, please try again later';
      showAlertDialog(context: context, message: errorMessage);
      return false;
    }
  }

  Future verify({
    required BuildContext context,
    required String code,
  }) async {
    startLoading();
    try {
      await connect().post("/auth/register/verify", data: {
        "email": emailController.text,
        "code": code,
      }).then((value) {
        storeToken(value);

        emailController.clear();
        passwordController.clear();
        passwordCController.clear();

        successToast(context, message: 'Verification successful');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const UserDetails(),
          ),
        );
      });

      // if (response.statusCode == 200) {
      // }

      stopLoading();
    } on DioError {
      stopLoading();
      var errorMessage =
          'We could not process your request at this time, please try again later';
      errorToast(
        context,
        message: errorMessage,
      );
      return;
    } catch (e) {
      stopLoading();
      var errorMessage =
          'We could not process your request at this time, please try again later';
      errorToast(context, message: errorMessage);
      // return;
    }
  }

  Future completeRegistration({
    required BuildContext context,
  }) async {
    startLoading();
    try {
      ResponseModel responseModel = ResponseModel();
      await connect().post("/auth/profile/complete", data: {
        "first_name": firstNameController.text,
        "last_name": lastNameController.text,
        "phone_number": phoneNumberController.text,
        "gender": selectedGender,
      }).then((value) async {
        firstNameController.clear();
        lastNameController.clear();
        phoneNumberController.clear();

        successToast(context, message: 'Registration successful');
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const BaseDashBoard(),
          ),
        );
      });

      stopLoading();
      return responseModel;
    } on DioError catch (e) {
      stopLoading();
      var errorMessage =
          'We could not process your request at this time, please try again later';
      errorToast(context, message: errorMessage);
      print('e: ${e.message}');
      return errorModelFromJson(e.response!.data);
    }
  }

  storeToken(response) {
    ResponseModel res = responseModelFromJson(response.data);
    log('res: $res');
    String myToken = res.tokens!.access;

    storageService.storeItem(key: token, value: myToken);
    // read token from storage
    storageService.readItem(key: token).then((value) {
      log('value token pass: $value');
    });
  }
}
