import 'dart:developer';

import 'package:buskeit/core/core.dart';
import 'package:dio/dio.dart';

import '../../../locator.dart';

connect() {
  StorageService storageService = getIt<StorageService>();

  BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 30000,
      receiveTimeout: 30000,
      responseType: ResponseType.plain);
  Dio dio = Dio(options);

  dio.interceptors.add(InterceptorsWrapper(onRequest: (options, handler) async {
    // String value = await storageService.readItem(key: token);

    // options.headers['Authorization'] = value ?? '';
    return handler.next(options);
  }, onResponse: (response, handler) {
    print(response.statusCode);
    log(response.data.toString());
    return handler.next(response);
  }, onError: (DioError e, handler) {
    return handler.next(e);
  }));

  return dio;
}
