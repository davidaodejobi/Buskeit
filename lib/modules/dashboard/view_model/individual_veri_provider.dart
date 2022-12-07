import 'dart:developer';
import 'dart:io';

import 'package:buskeit/constant/constant.dart';
import 'package:buskeit/core/services/api/base.api.dart';
import 'package:buskeit/core/services/services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../locator.dart';
import '../../../shared/shared.dart';
import '../screens/dash_board.dart';

class IndividualVeriProvider with ChangeNotifier {
  bool isLoading = false;
  HiveStorageService hiveStorageService = getIt<HiveStorageService>();

  startLoading() {
    isLoading = true;
    notifyListeners();
  }

  stopLoading() {
    isLoading = false;
    notifyListeners();
  }

  Future join({
    required BuildContext context,
    required String workspaceId,
  }) async {
    startLoading();
    try {
      // ResponseModel responseModel = ResponseModel();
      await connect().post(
        "/channels/users/join",
        data: {
          "invitation_code": workspaceId,
        },
      ).then(
        (value) async {
          if (value.statusCode == 200) {
            successToast(context,
                message: 'You have Successfully joined a workspace');

            hiveStorageService.storeItem(key: hasJoinedWorkspace, value: true);
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const BaseDashBoard(),
              ),
            );
          }
        },
      );
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
    }
  }
}
