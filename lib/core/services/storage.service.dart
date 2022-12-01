import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class StorageService {
  FlutterSecureStorage storage = const FlutterSecureStorage();
  bool isLoggedIn = false;

  void storeItem({required String key, required String value}) async {
    await storage.write(key: key, value: value);
    log('stored $key with value $value');
  }

  Future<dynamic> readItem({required String key}) async {
    final value = await storage.read(key: key);
    log('read $key with value $value');
    return value;
  }

  void deleteItem({required String key}) async {
    await storage.delete(key: key);
    log('deleted $key');
  }

  void deleteAllItems() async {
    await storage.deleteAll();
    log('deleted all items');
  }
}
