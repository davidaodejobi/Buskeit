import 'dart:developer';

import 'package:buskeit/core/models/res_model.dart';
import 'package:buskeit/modules/auth_flow/screens/user_details.dart';
import 'package:buskeit/modules/auth_flow/screens/verify_email.dart';
import 'package:buskeit/modules/dashboard_flow/screens/flow_selection.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../constant/constant.dart';
import '../../../core/core.dart';
import '../../../locator.dart';
import '../../../shared/alert_dialog.dart';

// var testData = {
//   "success": true,
//   "detail": "Account activated successfully",
//   "tokens": {
//     "access":
//         "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNjY4Njk4MTM1LCJpYXQiOjE2Njg2MTE3MzUsImp0aSI6ImFhMDZhMDgzMWI2NTQxZjVhNjU4MDJmMmYzYzM1OGQ2IiwidXNlcl9pZCI6Mjl9.0BxfVpJJU2JohXtJWW9zhPtX2MgzWMX4qxNLyTuir-Y",
//     "refresh":
//         "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY2OTIxNjUzNSwiaWF0IjoxNjY4NjExNzM1LCJqdGkiOiJjYWJlNmNkZThkNGY0MDU5YjE2YTg4Y2U4YjlhYThhZiIsInVzZXJfaWQiOjI5fQ.vYYirXBk3rRY1wa0ZsmUvgnTZfpdZDIfgABFyPl8HNw"
//   },
//   "user": {
//     "identifier": null,
//     "email": "actand253@hamham.uk",
//     "first_name": null,
//     "last_name": null,
//     "image": "http://buskeit.herokuapp.com/media/profiles/image-default.png",
//     "is_active": true,
//     "is_staff": false,
//     "is_verified": true,
//     "channel_accounts": []
//   }
// };

class SignupProvider with ChangeNotifier {
  StorageService storageService = getIt<StorageService>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordCController = TextEditingController();
  final verifyController = TextEditingController();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final List<String> _gender = ['Male', 'Female'];
  String selectedGender = 'Male';

  dropDownSelect(String gender) {
    selectedGender = gender;
    notifyListeners();
  }

  List<String> get gender => _gender;

  bool isLoading = false;

  validatePassword(context) {
    if (passwordController.text == passwordCController.text &&
        passwordController.text.isNotEmpty) {
      return true;
    } else {
      showAlertDialog(context: context, message: 'Passwords do not match');
      return false;
    }
    // return passwordCController.text == passwordController.text ? true : false;
  }

  startLoading() {
    isLoading = true;
    notifyListeners();
  }

  stopLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future signup({
    required BuildContext context,
  }) async {
    startLoading();
    try {
      ResponseModel responseModel = ResponseModel();
      await connect().post("/auth/register", data: {
        "email": emailController.text,
        "password1": passwordController.text,
        "password2": passwordCController.text,
      }).then((value) async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VerifyEmail(
              email: emailController.text,
            ),
          ),
        );
      });

      stopLoading();
      return responseModel;
    } on DioError catch (e) {
      stopLoading();
      var errorMessage =
          'We could not process your request at this time, please try again later';
      showAlertDialog(context: context, message: errorMessage);
      print('e: ${e.message}');
      return errorModelFromJson(e.response!.data);
    }
  }

  Future verify({
    required BuildContext context,
  }) async {
    startLoading();
    try {
      ResponseModel responseModel = ResponseModel();
      await connect().post("/auth/register/verify", data: {
        "email": emailController.text,
        "code": verifyController.text,
      }).then((value) async {
        storeToken(value);
        if (value.statusCode == 200) {
          storeToken(value);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UserDetails(),
            ),
          );
        }
      });

      stopLoading();
      return responseModel;
    } on DioError catch (e) {
      stopLoading();
      var errorMessage =
          'We could not process your request at this time, please try again later';
      showAlertDialog(context: context, message: errorMessage);
      print('e2gfdgy: ${e.message}');
      return;
    } catch (e) {
      stopLoading();
      var errorMessage =
          'We could not process your request at this time, please try again later';
      showAlertDialog(context: context, message: errorMessage);
      print('e: ${e.toString()}');
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
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const DashBoard(),
          ),
        );
      });

      stopLoading();
      return responseModel;
    } on DioError catch (e) {
      stopLoading();
      var errorMessage =
          'We could not process your request at this time, please try again later';
      showAlertDialog(context: context, message: errorMessage);
      print('e: ${e.message}');
      return errorModelFromJson(e.response!.data);
    }
  }

  storeToken(response) {
    ResModel res = resModelFromJson(response.data);
    log('res: $res');
    String myToken = res.tokens!.access;

    storageService.storeItem(key: token, value: myToken);
    // read token from storage
    storageService.readItem(key: token).then((value) {
      log('value token pass: $value');
    });
  }
}
