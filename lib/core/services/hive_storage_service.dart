import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveStorageService {
  var box = Hive.box('settings');

  void storeItem({required String key, required var value}) async {
    await box.put(key, value);
    debugPrint('stored $value in $key');
  }

  Future<dynamic> readItem({required String key}) async {
    final value = await box.get(key);
    debugPrint('read $value from $key');
    return value;
  }

  void deleteItem({required String key}) async {
    debugPrint('deleted $key');
    await box.delete(key);
  }

  // void getAll(List<String> keys) async {
  //   await box.getAll(keys);
  // }

  // void deleteAllItems() async {
  //   await box.deleteAll([]);
  // }
}
