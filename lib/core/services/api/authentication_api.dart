import 'package:buskeit/core/core.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../constant/constant.dart';
import '../../../locator.dart';
import 'base.api.dart';

class AuthenticationApiService with ChangeNotifier {
  StorageService storageService = getIt<StorageService>();

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
      storeToken(response.data);
      if (response.statusCode == 200) {
        // print('response.data: ${response.data}');
        responseModel = responseModelFromJson(response.data);
      }
      return responseModel;
    } on DioError catch (e) {
      return 'Error: ${e.message}';
    }
  }

  storeToken(response) {
    ResponseModel res = responseModelFromJson(response);
    String myToken = res.tokens!.access;

    if (myToken != '') {
      storageService.storeItem(key: token, value: myToken);
    }
  }

  removeToken() {
    storageService.deleteItem(key: token);
  }
}
