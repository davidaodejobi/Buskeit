import 'dart:developer';

import 'package:buskeit/core/core.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../constant/constant.dart';
import '../../../locator.dart';
import 'base.api.dart';

class AuthenticationApiService with ChangeNotifier {
  StorageService storageService = getIt<StorageService>();

  // var testData = {
  //   "success": true,
  //   "detail": "Login is successful",
  //   "tokens": {
  //     "access": 'null',
  //     "refresh":
  //         "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY3MDE3MjMyOCwiaWF0IjoxNjY5NTY3NTI4LCJqdGkiOiI4OWY5ODA3ZmY5MTc0MjBhOWU0YWZjMmQ4YmYwZTMxOCIsInVzZXJfaWQiOjN9.I-ICQblqUiGAIC2XEVZSsEyW0KOfMKVnxabC0U5ZFVM"
  //   },
  //   "user": {
  //     "identifier": "USN0ZA5CV1SPIOD4V",
  //     "email": "talk2ayomi1@gmail.com",
  //     "first_name": null,
  //     "last_name": null,
  //     "image": "http://buskeit.herokuapp.com/media/profiles/image-default.png",
  //     "is_active": true,
  //     "is_staff": false,
  //     "is_verified": true,
  //     "channel_accounts": []
  //   }
  // };

  Future login({
    required String email,
    required String password,
  }) async {
    try {
      ResponseModel responseModel = ResponseModel();
      Response response = await connect().post("/auth/token", data: {
        "email": email,
        "password": password,
      });
      log('response.statusCode: ${response.statusCode}');
      responseModel = responseModelFromJson(response.data);
      storeToken(response.data);
      // if (response.statusCode == 200) {
      //   // print('response.data: ${response.data}');
      //   print('responseModel: ${responseModel.detail}');
      // }
      return responseModel;
    } on DioError catch (e) {
      print(
          'errorModelFromJson(e.response!.data): ${errorModelFromJson(e.response!.data)}');
      return errorModelFromJson(e.response!.data);
    }
  }

  storeToken(response) {
    ResponseModel res = responseModelFromJson(response);
    String myToken = res.tokens!.access!;

    if (myToken != '') {
      storageService.storeItem(key: token, value: myToken);
    }

    // storageService.storeItem(key: token, value: myToken);
    // read token from storage
    // storageService.readItem(key: token).then((value) {});
  }

  removeToken() {
    storageService.deleteItem(key: token);
  }
}
